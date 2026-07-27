# Lab 01: Environment Setup

To launch the lab, you need to set up the environment.

---
## PDK Installation

Install the PDK:

```sh
cd pdk
./install.sh
cd ..
```

---
## Tools Setup

Set up the tools:

```sh
cd scripts
source tools_setup.sh
```

---
## Project Creation

Create a project named `lab01` in the `lab` directory:

```sh
./new_project.sh -n lab01 -d ../lab
```

---
## Finalize Setup

Finalize the setup:

```sh
cd ../lab/lab01
source pdk_setup.sh
```

---
## Library Setup

Extract the `MAPS_academy_helper` library in the project directory:

```sh
tar -xzvf ../materials/MAPS_academy_helper.tar.gz
```

Add the library to the library definition file (`cds.lib`):

```sh
echo "DEFINE MAPS_academy_helper MAPS_academy_helper" >> cds.lib
```

---
## Launch Virtuoso

Launch Virtuoso:

```sh
virtuoso &
```

If everything is set up correctly, you will see the **CIW** (Command Interpreter Window):

![CIW](../images/lab01_1.png)
