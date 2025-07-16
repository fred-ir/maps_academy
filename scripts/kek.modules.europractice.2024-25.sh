#!/usr/bin/env tcsh

################################################
#     PDK setup file for tcsh environement     #
################################################

# Check if file is sourced
set sourced = ($_)
if ("$sourced" == "") then
   echo "Script should be sourced."
   exit 1
endif

# No specific setup needed for KEK