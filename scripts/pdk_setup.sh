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
setenv PDKROOT `realpath __PDKROOTDIR__/sky130_release_0.0.7`
setenv IPROOT  `realpath __PDKROOTDIR__/sky130_scl_9T_0.0.7/sky130_scl_9T`

# Define PDK environment variables
setenv PEGASUS_LVS $PDKROOT/Sky130_LVS
setenv PEGASUS_DRC $PDKROOT/Sky130_DRC

if ( ! -e $PDKROOT/cds.lib ) then
    echo "PDK not found"
    echo "check PDKROOT environnement or PDK installation"
    exit 1
endif

# Test if cds.lib file exist
# If not create it and add PDK default cds.lib
if ( ! -e cds.lib ) then
    if (! -r ${PDKROOT}/cds.lib) then
        echo "Error: No read permission for PDK cds.lib file '${PDKROOT}/cds.lib'!"
        exit 1
    endif
    if (! -r ${PDKROOT}) then
        echo "Error: No read permission for PDK sky130 directory '${PDKROOT}'!"
        exit 1
    endif
    echo "SOFTINCLUDE $PDKROOT/cds.lib" >> cds.lib

    if (! -r ${IPROOT}) then
        echo "Error: No read permission for IP sky130_scl_9T directory '${IPROOT}'!"
        exit 1
    endif
    if (! -r ${IPROOT}/oa) then
        echo "Error: No read permission for IP sky130_scl_9T ./oa directory '${IPROOT}/oa'!"
        exit 1
    endif
    if (! -r ${IPROOT}/oa/sky130_scl_9T) then
        echo "Error: No read permission for IP sky130_scl_9T ./oa/sky130_scl_9T directory '${IPROOT}/oa/sky130_scl_9T'!"
        exit 1
    endif
    echo "DEFINE sky130_scl_9T $IPROOT/oa/sky130_scl_9T" >> cds.lib
endif

# Test if display.drf file exist
# If not copy it from PDK
if ( ! -e display.drf ) then
    cp $PDKROOT/display.drf .
    
    if (! -r ${PDKROOT}/display.drf) then
        echo "Error: No read permission for PDK display.drf file '${PDKROOT}/display.drf'!"
        exit 1
    endif
endif

# Remove automatic setting environnement loading
if ( ! -e .cdsinit ) then
    touch .cdsinit
endif
if ( ! -e .cdsenv ) then
    touch .cdsenv
endif


echo "[info] PDK environnement set"