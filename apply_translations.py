#!/usr/bin/env python3
"""
Apply all translation updates to Supabase in batches.
Reads combined_all_batches.sql and executes in chunks of 10 UPDATE statements.
"""
import sys
import time

# Read the combined SQL file
print("Reading combined_all_batches.sql...")
with open('combined_all_batches.sql', 'r') as f:
    content = f.read()

# Split into individual UPDATE statements
updates = []
current_update = []
for line in content.split('\n'):
    if line.strip().startswith('UPDATE questions'):
        if current_update:
            updates.append('\n'.join(current_update))
        current_update = [line]
    elif current_update:
        current_update.append(line)

# Add the last update
if current_update:
    updates.append('\n'.join(current_update))

print(f"Found {len(updates)} UPDATE statements")
print(f"Processing in batches of 10...")
print()

# Group into batches of 10
batch_size = 10
for i in range(0, len(updates), batch_size):
    batch = updates[i:i+batch_size]
    batch_num = (i // batch_size) + 1
    total_batches = (len(updates) + batch_size - 1) // batch_size

    # Combine the batch
    batch_sql = '\n'.join(batch)

    # Write to a temporary file for this batch
    filename = f'temp_batch_{batch_num:03d}.sql'
    with open(filename, 'w') as f:
        f.write(batch_sql)

    print(f"Batch {batch_num}/{total_batches}: {len(batch)} updates written to {filename}")

print()
print(f"Created {total_batches} batch files")
print("Ready to apply via MCP tools")
