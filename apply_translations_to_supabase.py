#!/usr/bin/env python3
"""
Apply translated questions to Supabase database
"""
import re
import sys

# Read the SQL file
print("Reading SQL file...", flush=True)
with open('update_questions.sql', 'r', encoding='utf-8') as f:
    sql_content = f.read()

# Split into individual UPDATE statements
updates = re.split(r'\n(?=UPDATE questions)', sql_content)
updates = [u.strip() for u in updates if u.strip() and u.strip().startswith('UPDATE')]

print(f"Found {len(updates)} UPDATE statements", flush=True)
print(f"\nReady to apply to Supabase!", flush=True)
print(f"\nFirst update preview:")
print(updates[0][:200] + "..." if len(updates[0]) > 200 else updates[0])

print(f"\nTo apply these updates, use the Supabase MCP execute_sql tool in batches.")
print(f"Each batch should contain ~50-100 UPDATE statements.")

# Create batch files
batch_size = 50
for i in range(0, len(updates), batch_size):
    batch_num = i // batch_size + 1
    batch = updates[i:i+batch_size]
    batch_sql = '\n'.join(batch)

    filename = f'batch_{batch_num:03d}.sql'
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(batch_sql)

    print(f"Created {filename} with {len(batch)} updates")

print(f"\nTotal batches created: {(len(updates) + batch_size - 1) // batch_size}")
