#!/usr/bin/env tcsh

################################################
#           clean lab environnement            #
################################################

echo "[info] cleaning lab directory"

rm -Rf libManager.log*
rm -Rf .tmp_$USER
rm -Rf .cadence
rm -Rf logs_$USER
rm -Rf .cdsenv .cdsinit cds.lib display.drf