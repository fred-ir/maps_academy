# Lab 07: Layout of the CSA Amplifier

---
## Layout Generation

This exercise differs from the previous ones. You will create a layout for the **Charge-Sensitive Amplifier (CSA)** and then perform a simulation based on the extracted layout.

In the **Library Manager**, locate:

   Library           | Cell        |
 |-------------------|-------------|
 | MAPS_academy_lab  | step4_CSA   |

!!! rmb "Right-click on the cell name `step4_CSA` and select **Copy**"

On the right side of the **Copy Cell** window, enter:

 | To Library        | Cell             |
 |-------------------|------------------|
 | MAPS_academy_lab  | step6_CSA_layout |

Open the schematic of the newly created cell, `step6_CSA_layout`. From the top menu, select:

!!! menu "Launch->Layout XL"

Click **OK** in both windows that appear. Your screen will divide into two parts: the schematic on the left and the layout on the right.

Before proceeding, modify the settings as follows: In the layout window, navigate to:

!!! menu "Options->Editor"

The **Layout Editor Options** window will appear. In the **Wire Editing** section, change the **Default Wire Constraint Group** to `LEFDefaultRouteSpec_fd_pr-main` (the first option in the list). Enable the **Show Alignment Markers** checkbox and close the **Options** window by clicking **OK**.

In the **Virtuoso Studio Layout Suite**, navigate to:

!!! menu "Connectivity->Generate->All From Source"

A **Generate Layout** window will appear. In the **Generate** section, uncheck **PR Boundary** and click **OK**.

This generates four transistors and seven pins, as shown in the following figure. If the transistors are not visible as in the figure below, use ++shift+f++ to enable the layout view.

![Generate Layout](../images/lab07_1.png)

Note that selecting a transistor in the layout (by clicking on it) also selects it in the schematic.

Select each transistor and perform the following: press ++q++ to open the **Instance Properties** window. In this window, modify the following settings:
- Set **Gate Connection** to `Top` for all transistors except the input (`PM1`), which should be set to `Bottom`. This generates the contacts for the gates of the transistors.
- Enable **M1/Mcon on S/D** to add metal contacts on the source and drain of the transistors.
- Select **Right Tap** for `NMOS` transistors and **Top Tap** for `PMOS` transistors.

Then, select the input `PMOS` transistor (`PM1`) and modify another property: In the **S/D Connection** section, select **Both**. Since the input transistor is long and narrow (high `W/L` ratio), it is divided into 4 parallel fingers. Selecting this option creates the internal connections.

After modifying the transistor parameters, your layout should resemble the following:

![Update Transistor](../images/lab07_2.png)

For simpler routing, exchange the source and drain of the `NM1` transistor (the one with its gate connected to `Vl`). Select it in the layout window and press ++q++, then click on **Switch S/D**.

---
## NWELL Connection

Now, start the routing by drawing the NWELL to connect both NWELLs (of transistors `PM1` and `PM2`). In the **Layers** window on the left, select the `nwell drw` layer.

Right-click and hold to zoom to the area where the two NWELLs will connect, as shown in the following image:

![Zoom on Layout](../images/lab07_3.png)

Then, use the mouse wheel to zoom in to the corner of the NWELL.

![NWELL Corner](../images/lab07_4.png)

While pointing at the corner of the NWELL (green area with dots) with the `nwell drw` layer selected, press ++r++ and click the ++left-button++. Zoom out using the mouse wheel and draw a rectangle to connect both NWELLs. While drawing, you can also zoom in with the mouse wheel to position the rectangle precisely. When satisfied with the rectangle, press the ++left-button++ to place it and then ++esc++.

![NWELL Corner Zoom](../images/lab07_5.png)

To undo changes, press ++u++; to redo, press ++shift+u++.

Before proceeding, ensure you are in **Partial Select Mode**. In the middle of the **Virtuoso Studio Layout** window, you will see the following section:

![Selection in Layout](../images/lab07_6.png)

If `(F)Select` appears, you are in **Full Select Mode**. Press ++f4++ to switch to `(P)Select` for **Partial Select Mode**.

If your rectangle is too small or too large, as shown in the following image:

![Resize Rectangle](../images/lab07_7.png)

Hover your mouse over the edge of the rectangle and select it when highlighted. Press ++s++ and click the ++left-button++, then stretch the rectangle to the correct size.

---
## Metal Routing

### VSSA Net Routing

The next step is to electrically connect the metal layers. Start with the `vssa` node connections.

Press ++f++ to zoom out to the full layout, then zoom in by pressing ++right-button++ and dragging a rectangle on the right side of the layout.

From the **Layers** list, select `met1 drw`. Place your mouse over the `vssa` metal line and press ++p++ (or ++shift+ctrl+w++) to create a wire. Your cursor will change shape, displaying `met1 (0.27)`. This means that any wire placed here will automatically have a width of 0.27 µm, matching the metal layer width of the `vssa` contacts.

Place a wire to connect the substrates of both NMOS transistors. Then, draw a rectangle to connect the source of transistor `NM1` to these substrate contacts. You can also use a wire to connect the source and substrate contacts. In wire mode, position the mouse cursor near the long edge of the source or substrate contacts. The cursor will change to `met1 (2.4)`. Click to connect to the other part.

The `vssa` node routing is complete.

---
### net5 Net Routing

Now, connect the `net5` net, which links the input transistor `PM1` to `NM1` and `NM2`.

Zoom in to the area where `net5` is located.

Hover your mouse over the `net5` net from the `PM1` transistor and press ++p++ to connect this line to the `NM1` drain. Then, draw another line from the `NM2` transistor down to the `net5` line you previously drew:

![Net5 Connected](../images/lab07_9.png)

Ensure you are not violating the `metal1-metal1` spacing design rule. The two `metal1` paths must be separated by at least 0.14 µm.

To verify this, zoom in to the area of concern and press ++k++, then select both edges of the metal paths. This will display a ruler between the metal paths, showing the distance. (To remove all rulers, press ++shift+k++).

If the paths are too close, use the stretch tool again. Press ++ctrl+d++ to deselect all selected elements, then press ++s++ and click on the path you want to stretch.

---
### VDDA Net Routing

Now, interconnect all the metal nets on the `vdda` node. This can be done by drawing a single line upward from the `PM1` transistor. However, ensure you maintain a 0.14 µm distance from the `Vh` metal layer on `PM2`.

---
### OUT Net Routing

To complete the routing, connect the output node `out` to the drain of `NM2` and to the drain of `PM2`.

---
## Placing Pins and Labels

Finally, focus on the small rectangles (pins) that have been generated. Select each pin and move it (press ++m++ and click the ++left-button++) to its destination on the metal paths. The layout tool will display a guide line.

When the pins are placed, add labels to each pin in the final step.

!!! menu "Options->Display"
    ++e++

In **Display Control**, enable **Pin Names** to display them. Now, select the `met1 lbl` (or `met1 label`) layer.

!!! menu "Create->Label"
    ++l++

Enter the pin name and place the label on the pin. (The small cross in the center of the label must be placed on the pin).

When placing the name, a helper pop-up may appear asking on which object to place the label. Select `met1 drawing rect`.

You can also adjust the font size in the label properties (select the label and press ++q++).

!!! warning
    **Warning**: The label cross must be placed on the metal pin for the verification tools to function correctly.

---
## Perform Layout vs. Schematic (LVS) Verification

Verify if your layout matches the schematic. In the **Virtuoso Studio Layout**, navigate to:

!!! menu "PVS->Run LVS"

The following window will appear:

![PVS LVS Open](../images/lab07_10.png)

In the **Rules** pane, select the `sky130` technology as shown below.

![PVS Rules Selection](../images/lab07_11.png)

To run the LVS comparison, click the red **Submit** button. If your layout is correctly connected, you should see the following window. If not, check the errors (click **Yes** to view the debug window) and fix them by reviewing the instructions.

![LVS Match](../images/lab07_12.png)

---
## Perform Design Rule Check (DRC)

This is an important step before sending the circuit to production. In the **Virtuoso Studio Layout**, navigate to:

!!! menu "PVS->Run DRC"

In the **Rules** section, select the `sky130` technology as before. In the **Configurator** tab, select **Turn Off Inaccurate Rules** and **No Density**. Then, click **Submit**.

If errors appear in the **PVS DRC Results** window, correct them and click **ReRun** in the **PVS Reports** window. If the **PVS DRC Results** window is empty, you have successfully completed your first layout!

---
## Extract Parasitics for Post-Layout Simulation

After LVS and DRC are completed without errors, perform the parasitic extraction. In the **Virtuoso Studio Layout**, navigate to:

!!! menu "Quantus->Run PVS Quantus"

Click **OK** in the next window that appears to confirm extraction of the `step6_CSA_layout` cell.

In the **Quantus (PVS) Parasitic Extraction Run Form** window:

![Quantus Extraction Setup](../images/lab07_13.png)

In the **Setup** tab, go to **Output** and select **Interactive DSPF**. In the **Extraction** tab, ensure **Extraction Type** is set to `C only` and **Ref Node** is set to: `gnd!`.

Click **OK** to start the extraction. After a few moments, a small window will appear indicating that the extraction is complete.

![Quantus Extraction Finish](../images/lab07_14.png)

---
## Post-Layout Simulation with Extracted Parasitics

Close all Virtuoso schematic and layout windows.

In the **Library Manager**, locate:

 | Library           | Cell             | View      |
 |-------------------|------------------|-----------|
 | MAPS_academy_lab  | step5_tb_CSA_Rf  | schematic |

Right-click on the schematic **View** and select **Copy**. A **Copy View** window will appear. On the right side, select:

 | Library           | Cell               | View      |
 |-------------------|--------------------|-----------|
 | MAPS_academy_lab  | step7_tb_CSA_extr  | schematic |

Click **OK** to close the window and copy the schematic.

Open the `step7_tb_CSA_extr` schematic. Select the `CSA` used previously and delete it:

!!! menu "Edit->Delete"
    ++del++

Add the symbol of the `step6_CSA_layout` cell you designed in the previous step. Connect all signals (`vssa` connects directly to the `gnd` symbol or a node labeled `gnd!`).

Create the **ADE Explorer** testbench. When the **ADE Explorer** window opens, import the testbench settings from a previous run:

!!! menu "Session->Import"

In the **Select View** section, select:

 | Library           | Cell             | View     |
 |-------------------|------------------|----------|
 | MAPS_academy_lab  | step5_tb_CSA_Rf  | maestro  |

Now, add the information from the extraction. In the **Virtuoso ADE Explorer**, navigate to:

!!! menu "Setup->Simulation Files"

In the **Paths/Files** tab, select **Parasitic Files (dspf)** and double-click to add the file: `step6_CSA_layout.dspf`. This file should appear in the list.

Confirm the file selection by clicking **Open**, then close the **Simulation Files Setup** window by clicking **OK**.

Run the simulation and wait for completion. You may observe slight differences from the previous simulation due to the parasitic capacitors in the layout.

---
## Explore Your Design in 3D

Follow the link [GDS Viewer](https://gds-viewer.tinytapeout.com) and upload the GDS file.

A GDS file was generated during the LVS step in the `pvs_lvs` directory with the name `step6_CSA_layout.gds`.