#!/usr/bin/env bash

# this script is used to run the makeOp.ts script with Node.js or Bun, depending on which is available
# It allows you to pass arguments to the script, which will be forwarded to the Node.js or Bun command
# Because it cannot be done directly in package.json due to some limitations

if command -v bun >/dev/null 2>&1; then
  bun scripts/db/makeOp.ts $@;
else
  node scripts/db/makeOp.ts $@;
fi
