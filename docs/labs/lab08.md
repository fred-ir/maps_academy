# Restart labs after a loss of connection

To relaunch the documentation and the setup after loosing the connection

## Relaunch the documentation

Go to the main directory where `venv` directory is located, and start the virtual environement

```sh
source venv/bin/activate.csh
```

Launch the docuemntation from the script directory.

```sh
cd scripts
./launch_doc.sh
```

## Relaunch the tools setup

Setup the tools.

```sh
source tools_setup.sh
```

## Relaunch the setup

To setup the PDK

```sh
cd ../lab/lab01
source pdk_setup.sh
```

## Relaunch virtuoso

To relaunch virtuoso.

```sh
virtuoso &
```

If everything is going well you will see the `CIW` (Command Interpreter window)

![CIW](../images/lab01_1.png)
