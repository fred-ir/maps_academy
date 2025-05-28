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

module use /work/uelibs/module/rh8

module load cds/lic/iphc
module load cds/europactice/2024-2025/ic-23.10.070
module load cds/europactice/2024-2025/spectre-24.10.078
module load cds/europactice/2024-2025/pvs-24.10.000
module load cds/europactice/2024-2025/quantus-23.11.000