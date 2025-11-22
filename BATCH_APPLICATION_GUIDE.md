# Batch Application Guide

## Status
- **Total Batches**: 118 files (temp_batch_001.sql to temp_batch_118.sql)
- **Total Updates**: 1,177 UPDATE statements
- **Batch Size**: 10 updates per file (except last batch with 7)

## Files Ready
All 118 batch SQL files have been created in the project root directory.

## Application Method

### Recommended: Use Supabase SQL Editor
Since the MCP execute_sql tool has issues with apostrophes when passing parameters, the most reliable method is:

1. **Manual Application via SQL Editor**:
   - Open Supabase Dashboard → SQL Editor
   - Copy content from `combined_all_batches.sql`
   - Execute in SQL Editor
   - This avoids parameter escaping issues

2. **Alternative: Apply via psql**:
   ```bash
   # If you have direct psql access to your Supabase database
   psql $DATABASE_URL -f combined_all_batches.sql
   ```

3. **Alternative: Supabase CLI**:
   ```bash
   # Using Supabase CLI
   supabase db execute -f combined_all_batches.sql
   ```

## Why Not MCP execute_sql?
The `mcp__supabase__execute_sql` tool has challenges with:
- Apostrophes in JSON strings (e.g., "What's" → "What''s" needed)
- Large payloads with special characters
- Unicode escape sequences in JSONB

The SQL files themselves are correctly formatted with proper escaping, but passing them as parameters through the MCP tool introduces encoding issues.

## Verification After Application
Run this query to verify all languages are present:

```sql
SELECT
    category_name,
    COUNT(*) as total_questions,
    SUM(CASE WHEN translations ? 'sv' THEN 1 ELSE 0 END) as has_swedish,
    SUM(CASE WHEN translations ? 'fi' THEN 1 ELSE 0 END) as has_finnish,
    SUM(CASE WHEN translations ? 'it' THEN 1 ELSE 0 END) as has_italian,
    SUM(CASE WHEN translations ? 'nl' THEN 1 ELSE 0 END) as has_dutch,
    SUM(CASE WHEN translations ? 'no' THEN 1 ELSE 0 END) as has_norwegian,
    SUM(CASE WHEN translations ? 'pl' THEN 1 ELSE 0 END) as has_polish
FROM questions
GROUP BY category_name
ORDER BY category_name;
```

All counts should match total_questions for each category.
