#!/bin/tcsh

# Check if script is run from its own directory
set relative_script_dir = `dirname "$0"`
set script_dir = `realpath "$relative_script_dir"`
set current_dir = `realpath "$cwd"`
if ("$script_dir" != "$current_dir") then
    echo "Error: Please run this script from its own directory: $script_dir"
    exit 1
endif

# Check python virtual environment
if (! $?VIRTUAL_ENV) then
    echo "Error: No Python virtual environment detected. Please activate your venv."
    exit 1
endif

# Move to docs directory and launch server
cd ../docs
python3 -m http.server 8002 >& /dev/null &
if ($status != 0) then
    echo "Error: Failed to launch Python HTTP server!"
    exit
endif

# Move to main directory and launch MkDocs server
cd ..
mkdocs serve >& /dev/null &
if ($status != 0) then
    echo "Error: Failed to launch MkDocs server!"
    exit 1
endif

# Open default web browser to http://127.0.0.1:8000
open http://127.0.0.1:8000