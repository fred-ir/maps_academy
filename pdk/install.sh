#!/usr/bin/env tcsh
################################################
#              install PDK                     #
################################################

# Set umask
umask 077

echo "Deflating tar files ..."

tar xzf sky130_release_0.0.4a.tar.gz
tar xzf sky130_scl_9T_0.0.5a.tar.gz

echo "PDK installation successful"