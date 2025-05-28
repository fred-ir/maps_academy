# Setup environnement

You need to setup the PDK and the tools environnement

## Quick startup

```
./pdk_setup.sh
./tools_setup.Sh
```

## PDK

If PDK is not installed check [../pdk/README.md](../pdk/README.md)

Run `pdk_setup.sh` script

## Tools

Run `tools_setup.sh`

## Cluster

### List of available clusters
- IPHC

### Set new cluster

The cluster is identify by the hostname find in `HOST` environnement variable.

Modify `tools_setup.sh` script by updating and adding these lines

```shell
if ($HOST =~ sbgue*.in2p3.fr) then
  echo Found IPHC cluster: $HOST
  set CLUSTER="iphc"
  set TOOLS_EUROP_VERSION="2024-25"
endif
```

Create a scripts called `${CLUSTER}.modules.europractice.${TOOLS_EUROP_VERSION}.sh` with specific installation commands.

The `TOOLS_EUROP_VERSION` allows to set different tools version.
