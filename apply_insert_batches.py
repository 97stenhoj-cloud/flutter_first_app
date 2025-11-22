#!/usr/bin/env python3
"""
Apply INSERT batches to Supabase via execute_sql.
This script prints out the SQL that should be executed via MCP.
"""
import sys

print("=" * 80)
print("INSTRUCTIONS FOR APPLYING INSERTS TO SUPABASE")
print("=" * 80)
print()
print("There are 24 batch files to apply:")
print("  insert_batch_001.sql through insert_batch_024.sql")
print()
print("Each batch contains 50 INSERT statements (except the last).")
print()
print("RECOMMENDED APPROACH:")
print("  Since individual batch files can be applied via MCP execute_sql,")
print("  copy the contents of insert_all_questions.sql to Supabase SQL Editor")
print("  and execute it there in one go.")
print()
print("ALTERNATIVE - Apply via MCP (slower but automated):")
print("  Use Claude Code with the mcp__supabase__execute_sql tool to")
print("  read and execute each batch file sequentially.")
print()
print("Total questions to insert: 1200")
print("=" * 80)
print()
print("File ready: insert_all_questions.sql")
print("Size:", flush=True)

import os
file_size = os.path.getsize('insert_all_questions.sql')
print(f"  {file_size:,} bytes ({file_size / 1024 / 1024:.2f} MB)")
