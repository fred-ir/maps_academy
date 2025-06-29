# Full CSA simulation

## Schematic creation

Now that we have the core of the CSA designed with real transistors, we should test how it behaves in the CSA configuration.

For this step we will reuse schematic of `step3_idealCSA_Rf`.

Go to the `library Manager` and find:

| Library            | Cell               | View      |
|--------------------|--------------------|-----------|
| MAPS_academy_lab   | step3_idealCSA_Rf  | schematic |

!!! rmb "On the `schematic` view select `Copy`"

A `Copy View` window will appear. In the right side put:

| Library            | Cell               | View      |
|--------------------|--------------------|-----------|
| MAPS_academy_lab   | step5_tb_CSA_Rf    | schematic |

Click `OK` to close the window and copy the schematic.

Go to the `step5_CSA_Rf` schematic and open it. Select the `idealOpAMP` that we used before and delete it with:

!!! menu "Edit->Delete"
    ++del++

Delete also the `ground` symbol and corresponding connection:

!!! lmb "Click and drag the mouse"
    to select and press ++del++

Add the `CSA` you have designed in the previous step (`step4_CSA`). To complete the test bench, you’ll need to add also the `bias_block` instance and a `vdc` source that will generate the `vdda` voltage.

With all the elements in place, your schematic should be similar to the following on:

![Test bench schematic full CSA simulation](../images/lab06_1.png)

## Run simulation

Create the `ADE Explorer` test bench. When the `ADE Explorer` window open, let’s import the test bench settings from a previous run:

!!!menu "Session->Import"

In the `Select View` section choose:

| Library            | Cell               | View     |
|--------------------|--------------------|----------|
| MAPS_academy_lab   | step3_idealCSA_Rf  | maestro  |

Click `OK`.

This will import all the analyses, outputs and expressions that we set up before.

Run the simulation and wait for it to complete.
