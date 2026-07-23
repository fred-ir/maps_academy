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
switch ("$HOST")
  case sbgue*.in2p3.fr:
    echo "[info] Found IPHC cluster: $HOST"
    set CLUSTER="iphc"
    set TOOLS_EUROP_VERSION="2024-25"
    breaksw
  case *.kek.jp:
    echo "[info] Found KEK cluster: $HOST"
    set CLUSTER="kek"
    set TOOLS_EUROP_VERSION="2024-25"
    breaksw
  case *.slac:
    echo "[info] Found SLAC cluster: $HOST"
    set CLUSTER="slac"
    set TOOLS_EUROP_VERSION="2024-25"
    breaksw
endsw

source ${CLUSTER}.modules.europractice.${TOOLS_EUROP_VERSION}.sh

# Remove automatic setting environnement loading
setenv CDS_LOAD_ENV CWD

echo "[info] Tools environnement set"