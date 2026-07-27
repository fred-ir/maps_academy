# Lab 08: Restart Labs After a Loss of Connection

---
## Relaunch Documentation

Navigate to the main directory where the `venv` directory is located, and start the virtual environment:

```sh
source venv/bin/activate.csh
```

Launch the documentation from the **scripts** directory:

```sh
cd scripts
./launch_doc.sh
```

---
## Relaunch Tools Setup

Set up the tools:

```sh
source tools_setup.sh
```

---
## Relaunch PDK Setup

To set up the PDK:

```sh
cd ../lab/lab01
source pdk_setup.sh
```

---
## Relaunch Virtuoso

To relaunch Virtuoso:

```sh
virtuoso &
```

If everything is set up correctly, you will see the **CIW** (Command Interpreter Window):

![CIW](../images/lab01_1.png)
