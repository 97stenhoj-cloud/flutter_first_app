# Apply Translations to Supabase

## Summary
- **Total Questions**: 1,200
- **Languages**: 13 (en, da, de, es, fi, fr, it, nl, no, pl, pt, ro, sv)
- **New Translations Added**: 6 languages (fi, it, nl, no, pl, sv)
- **SQL Files**: 24 batch files (50 updates each)

## Files Ready
- `combined_all_batches.sql` - All 1,200 UPDATE statements combined
- `batch_001.sql` through `batch_024.sql` - Individual batches

## How to Apply

### Option 1: Use Supabase SQL Editor (Recommended)
1. Go to your Supabase project dashboard
2. Navigate to SQL Editor
3. Copy the contents of `combined_all_batches.sql`
4. Execute the SQL
5. Wait for completion (~30-60 seconds)

### Option 2: Use Supabase CLI
```bash
supabase db execute -f combined_all_batches.sql
```

### Option 3: Apply via MCP Tools (Claude Code)
Ask Claude Code to execute the SQL using the `mcp__supabase__execute_sql` tool.

## Verification Queries

After applying, run these to verify:

```sql
-- Check that all questions have all 13 languages
SELECT
    category_name,
    COUNT(*) as total_questions,
    SUM(CASE WHEN translations ? 'en' THEN 1 ELSE 0 END) as has_en,
    SUM(CASE WHEN translations ? 'da' THEN 1 ELSE 0 END) as has_da,
    SUM(CASE WHEN translations ? 'de' THEN 1 ELSE 0 END) as has_de,
    SUM(CASE WHEN translations ? 'es' THEN 1 ELSE 0 END) as has_es,
    SUM(CASE WHEN translations ? 'fi' THEN 1 ELSE 0 END) as has_fi,
    SUM(CASE WHEN translations ? 'fr' THEN 1 ELSE 0 END) as has_fr,
    SUM(CASE WHEN translations ? 'it' THEN 1 ELSE 0 END) as has_it,
    SUM(CASE WHEN translations ? 'nl' THEN 1 ELSE 0 END) as has_nl,
    SUM(CASE WHEN translations ? 'no' THEN 1 ELSE 0 END) as has_no,
    SUM(CASE WHEN translations ? 'pl' THEN 1 ELSE 0 END) as has_pl,
    SUM(CASE WHEN translations ? 'pt' THEN 1 ELSE 0 END) as has_pt,
    SUM(CASE WHEN translations ? 'ro' THEN 1 ELSE 0 END) as has_ro,
    SUM(CASE WHEN translations ? 'sv' THEN 1 ELSE 0 END) as has_sv
FROM questions
GROUP BY category_name
ORDER BY category_name;

-- Test Swedish question retrieval
SELECT
    category_name,
    translations->>'en' as english,
    translations->>'sv' as swedish
FROM questions
WHERE category_name = 'Love Talks'
LIMIT 5;
```

## Expected Results
All categories should show the same count for all languages, matching the total_questions count.
