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

# Find out in which institute the script is being called
if ($HOST =~ sbgue*.in2p3.fr) then
  echo Found IPHC cluster: $HOST
  set CLUSTER="iphc"
  set TOOLS_EUROP_VERSION="2024-25"
endif

source ${CLUSTER}.modules.europractice.${TOOLS_EUROP_VERSION}.sh

echo "Tools environnement set"