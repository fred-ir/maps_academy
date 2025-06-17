# maps_academy

## Introduction
This repository is made for [MAPS Academy](https://wiki.kek.jp/display/mapschool/MAPS+Academy) Hands-on C (Cadence). The goal of this hands-on is to design a pixel based on CSA amplifer in [SkyWater SKY130](https://skywater-pdk.readthedocs.io/en/main/index.html) technology.
SkyWater 130 have not been tested for MIP detection. This PDK is used since it could be freely redistributed.

## Quick start-up

### PDK installation

Further information are given in [pdk/README.md](pdk/README.md).

To install the PDK, just run `install.sh` script in the pdk directory.

```
cd pdk
./install.sh
cd ..
```

### Setup tools

Further information are given in [lab/README.md](lab/README.md).

To setup the tools, just source `tools_setup.sh` script in the scripts directory.

```
cd scripts
source tools_setup.sh
cd ..
```

### Project creation

To create a project call `my_project` in the `lab` directory, run the `new_project.sh` script in the scripts directory.

```
cd scripts
./new_project.sh -n my_project -d ../lab
cd ..
```

### Launch the project

To finalize the setup and launch virtuoso in the project call `my_project` in the `lab` directory, source the `pdk_setup.sh` script.

```
cd lab/my_project
source pdk_setup.sh
virtuoso &
```

## Documentation

Documentation is based on `mkdocs`.

### Installation

Create the pyhton virtual environnement by sourcing the script `setup_doc.sh` in the scripts directory. In a separate terminal:

```
cd scripts
source setup_doc.sh
```

## PDK information

### Disclamer

The Sky130 Process Design Kits provide for use with Cadence Design Tools and Flows of Virtuoso and Innovus products. While the SKY130 process node and the PDK from which this open source release was derived have been used to create many designs that have been successfully manufactured commercially in significant quantities, the open source PDK is not intended to be used for production settings at this current time. It should be usable for doing test chips and initial design verification (but this is not guaranteed).

### License

The license of the PDK is available at https://www.cadence.com/content/dam/cadence-www/global/en_US/documents/terms-and-conditions/Cadence-Public-License-Version-1.0.pdf

The unmodifed source of the Sky130 PDK are:
- pdk/sky_130_release_0.0.7
- pdk/sky_130_scl_9T_0.0.7