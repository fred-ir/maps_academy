#!/usr/bin/env tcsh
################################################
#              install PDK                     #
################################################

# Set umask
umask 077

echo "[info] Deflating tar files ..."

# Deflating PDK and stdcells tar files
tar xzf sky130_release_0.0.4a.tar.gz
if ($status != 0) then
    echo "Error: Failed to extract PDK tar files!"
    exit 1
endif

tar xzf sky130_scl_9T_0.0.5a.tar.gz
if ($status != 0) then
    echo "Error: Failed to extract stdcells tar files!"
    exit 1
endif

# PVS setup
echo "[info] Setting up PVS ..."

cp pvs_files/techRuleSets sky130_release_0.0.4
if ($status != 0) then
    echo "Error: Failed to copy techRuleSets!"
    exit 1
endif

cp pvs_files/virtuoso6.drc_preset_golden sky130_release_0.0.4
if ($status != 0) then
    echo "Error: Failed to copy virtuoso6.drc_preset_golden!"
    exit 1
endif

cp pvs_files/virtuoso6.lvs_preset_golden sky130_release_0.0.4
if ($status != 0) then
    echo "Error: Failed to copy virtuoso6.lvs_preset_golden!"
    exit 1
endif

echo "[info] PDK installation successful"