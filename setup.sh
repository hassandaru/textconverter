#!/bin/bash

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DIRECTORY=$SCRIPT_DIR

# Set up venv and dependencies
pushd $DIRECTORY > /dev/null

if [ ! -d "$DIRECTORY/venv" ]; then
  # Create venv if it doesn't exist
  python -m pip install --user --upgrade pip
  python -m venv venv
fi

# Source venv and install dependencies
if [ -d venv/bin ]; then
  source venv/bin/activate
else
  source venv/Scripts/activate
fi
python -m pip install -r requirement.txt

popd > /dev/null
