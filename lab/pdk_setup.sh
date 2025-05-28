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

# Set umask
umask 077

# Define PDK root directory
setenv PDKROOT ../pdk/sky130_release_0.0.4

if ( ! -e $PDKROOT/cds.lib ) then
    echo "PDK not found"
    echo "check PDKROOT environnement or PDK installation"
    exit 1
endif

# Test if cds.lib file exist
# If not create it and add PDK default cds.lib
if ( ! -e cds.lib ) then
    echo "SOFTINCLUDE $PDKROOT/cds.lib" > cds.lib
endif

# Test if display.drf file exist
# If not copy it from PDK
if ( ! -e display.drf ) then
    cp $PDKROOT/display.drf .
endif

echo "PDK environnement set"