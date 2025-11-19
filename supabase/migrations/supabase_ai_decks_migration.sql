-- AI Generated Decks Migration
-- This migration creates the ai_generated_decks table with RLS policies

-- Create the ai_generated_decks table
CREATE TABLE IF NOT EXISTS ai_generated_decks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    deck_name TEXT NOT NULL,
    generation_prompts JSONB NOT NULL,
    -- Will contain: occasion, mood, depth, group_size, remarks
    questions JSONB NOT NULL DEFAULT '[]'::jsonb,
    -- Array of {question: string, answer: string}
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Create indexes for better performance
CREATE INDEX idx_ai_generated_decks_user_id ON ai_generated_decks(user_id);
CREATE INDEX idx_ai_generated_decks_created_at ON ai_generated_decks(created_at DESC);

-- Enable Row Level Security
ALTER TABLE ai_generated_decks ENABLE ROW LEVEL SECURITY;

-- RLS Policies

-- Users can only see their own AI generated decks
CREATE POLICY "Users can view own AI decks" ON ai_generated_decks
    FOR SELECT
    USING (auth.uid() = user_id);

-- Users can create their own AI generated decks
CREATE POLICY "Users can create own AI decks" ON ai_generated_decks
    FOR INSERT
    WITH CHECK (auth.uid() = user_id);

-- Users can update their own AI generated decks
CREATE POLICY "Users can update own AI decks" ON ai_generated_decks
    FOR UPDATE
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

-- Users can delete their own AI generated decks
CREATE POLICY "Users can delete own AI decks" ON ai_generated_decks
    FOR DELETE
    USING (auth.uid() = user_id);

-- Add a trigger to update the updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_ai_generated_decks_updated_at
    BEFORE UPDATE ON ai_generated_decks
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Grant permissions to authenticated users
GRANT ALL ON ai_generated_decks TO authenticated;

-- Optional: Create a view to easily convert AI decks to custom decks format
CREATE OR REPLACE VIEW ai_decks_as_custom AS
SELECT
    id,
    user_id,
    deck_name,
    jsonb_array_length(questions) as question_count,
    generation_prompts,
    created_at,
    updated_at
FROM ai_generated_decks;

-- Grant permissions on the view
GRANT SELECT ON ai_decks_as_custom TO authenticated;

-- Function to convert AI deck to custom deck (for later integration)
CREATE OR REPLACE FUNCTION convert_ai_deck_to_custom(ai_deck_id UUID)
RETURNS UUID AS $$
DECLARE
    new_deck_id UUID;
    ai_deck RECORD;
    question JSONB;
BEGIN
    -- Get the AI deck
    SELECT * INTO ai_deck FROM ai_generated_decks WHERE id = ai_deck_id;

    IF ai_deck IS NULL THEN
        RAISE EXCEPTION 'AI deck not found';
    END IF;

    -- Create a new custom deck
    INSERT INTO custom_decks (user_id, deck_name, is_favorites)
    VALUES (ai_deck.user_id, ai_deck.deck_name || ' (AI)', false)
    RETURNING id INTO new_deck_id;

    -- Copy all questions to custom_questions table
    FOR question IN SELECT * FROM jsonb_array_elements(ai_deck.questions)
    LOOP
        INSERT INTO custom_questions (deck_id, question_text, source_game_mode, source_category)
        VALUES (
            new_deck_id,
            question->>'question',
            'AI Generated',
            ai_deck.generation_prompts->>'occasion'
        );
    END LOOP;

    RETURN new_deck_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Grant execute permission on the function
GRANT EXECUTE ON FUNCTION convert_ai_deck_to_custom(UUID) TO authenticated;

-- Sample data structure for generation_prompts JSONB:
-- {
--   "occasion": "Birthday party",
--   "mood": "Lighthearted",
--   "depth": 3,
--   "group_size": 6,
--   "remarks": "Family friendly, include some funny questions"
-- }

-- Sample data structure for questions JSONB array:
-- [
--   {
--     "question": "What's your most embarrassing birthday memory?",
--     "answer": "Share a funny or awkward moment from a past birthday celebration"
--   },
--   {
--     "question": "If you could have any superpower for one day, what would it be?",
--     "answer": "Discuss what power you'd choose and how you'd use it"
--   }
-- ]