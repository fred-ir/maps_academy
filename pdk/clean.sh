#!/usr/bin/env tcsh

################################################
#           Clean PDK installation             #
################################################

echo "[info] Deleting PDK directories"
find . -maxdepth 1 -type d -name 'sky130*' -exec rm -Rf {} \;