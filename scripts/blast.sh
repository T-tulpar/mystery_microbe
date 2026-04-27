#!/bin/bash

echo "Starting process..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
conda run --no-capture-output -n microbe-id python "$SCRIPT_DIR/blast.py"
