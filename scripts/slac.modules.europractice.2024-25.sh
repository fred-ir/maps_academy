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

module load ic/23.10.130
module load spectre/25.10.235.isr5
module load pvs/25.10.000 
module load quantus/25.10.000

module list