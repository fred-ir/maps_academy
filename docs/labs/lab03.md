# Ideal Charge Sensitive Amplifier (CSA)

## Schematic

In the `Library Manager` window create a new schematic:

| Library             | Cell              | View      |
|---------------------|-------------------|-----------|
| MAPS_academy_lab    | step2_tb_idealCSA | schematic |

While adding the `step1_idealOpAMP` symbol, in the `Add Instance` pop-up, press the `Upside Down` button to flip the symbol horizontally so the negative pin is on the top. Place the symbol back on the schematic.

![Schematic ideal CSA](../images/lab03_1.png)

In order to recreate the rest of the ideal CSA schematic as in the picture above we need to add two capacitors:

| Library    | Cell | View   |
|------------|------|--------|
| analogLib  | cap  | symbol |

A pulsed current source:

| Library    | Cell   | View   |
|------------|--------|--------|
| analogLib  | ipulse | symbol |

We also need the output pin `out` and the `gnd` symbol.

The value of the capacitances: input Cd = 10 fF, feedback Cf = 3 fF.

To change the values, select the capacitance by clicking on it with a ++left-button++.

!!! menu "Edit->Properties->Objects"
    ++q++

The input current source should have the following parameters as in figure below.

![Input current source parameters](../images/lab03_2.png)

## Test bench
