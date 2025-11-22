#!/bin/bash

echo "Starting to apply all 24 batches to Supabase..."
echo "This will update 1,200 questions with translations for 13 languages"
echo ""

# Combine all batches into one file
cat batch_*.sql > combined_all_batches.sql

echo "Combined all batches into combined_all_batches.sql"
echo "Total UPDATE statements: $(grep -c '^UPDATE questions' combined_all_batches.sql)"
echo ""
echo "Ready to apply to Supabase via MCP tools"
