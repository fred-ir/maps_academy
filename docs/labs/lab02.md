# Lab 02: Ideal Operational Amplifier (OpAMP)

---
## Library Creation

Open the **Library Manager** from the **CIW** window:

!!! menu "Tools->Library Manager..."

![Library Manager](../images/lab02_1.png)

Create the library from the **Library Manager** window:

!!! menu "File->New->Library..."

![File New Library](../images/lab02_2.png)

In the **New Library** window, in the **Name** field, enter `MAPS_academy_lab`. Ensure you are in the `lab/lab01` directory. Then click **OK**.

![New Library](../images/lab02_3.png)

A new window appears to select the technology library. Select **Reference existing technology libraries**.

![Reference Techfile](../images/lab02_4.png)

Then, select the `sky130_fd_pr_main` **and** place it in the **Reference Technology Libraries** column. Click **OK**.

![Reference Techfile Animation](../images/lab02_5.png)

---
## Schematic Creation

From the **Library Manager**, select the library: `MAPS_academy_lab`.

Create the schematic view of the `step1_idealOpAMP` cell:

!!! menu "File->New->Cell View..."

![New Cell View Animation](../images/lab02_6.png)

!!! info "Views"
    The cells are composed of different views. For this tutorial, we will focus on the following views:
   View Name   | Purpose                                             |
 |-------------|-----------------------------------------------------|
 | `schematic` | Schematic of the electrical circuit of the cell     |
 | `symbol`    | Symbol used in schematic for hierarchical designs   |
 | `layout`    | Physical representation of the cell                 |
 | `maestro`   | Setup of the simulations                            |

In the **New File** window, fill the **Cell** field with `step1_idealOpAMP` and select **Type** as `schematic` (if not selected by default). The **View** field updates automatically with the selection of **Type**. Press **OK** to generate the new schematic.

!!! warning "View Name"
    It is possible to change the name of the view, but it is **not recommended** as it may break the flow.

![New Cell View](../images/lab02_7.png)

An empty schematic window appears.

![New Schematic](../images/lab02_8.png)

!!! info "Schematic and Layout Navigation"
    To navigate in the schematic and layout views, use the keyboard arrows to move the design left, right, up, and down. Use the mouse scroll wheel to zoom in and out.

---
## Schematic Drawing

Your goal in this step is to reproduce the following schematic:

![Original Schematic](../images/lab02_9.png)

### Add Pins

First, you need the pins for the amplifier: two inputs (`Vin_p` and `Vin_n`) and one output (`Out`).

In the **Virtuoso Studio Schematic Editor** window, select:

!!! menu "Create->Pin"
    ++p++

This will open the **Create Pin** pop-up window.

![Create Pin](../images/lab02_10.png)

!!! info "Pop-up Window"
    If the pop-up window does not appear, press the ++f3++ key. The ++f3++ key is used to show or hide the current action pop-up window in **Virtuoso Studio**.

Ensure that **Direction** is set to `input`. In the **Names** field, enter `Vin_p Vin_n` with a ++space++ between the two names. Return to the **Virtuoso Studio Schematic Editor** window. While hovering over the schematic, you will see a yellow symbol of the input pin `Vin_p`. Move the mouse to the middle of the schematic and press the ++left-button++ to place the first pin, which turns red. Now, the yellow symbol switches to the second pin. Place the second pin as you did for the first one.

Repeat the same process for the output pin, but set **Direction** to `Output`.

You should end up with a schematic similar to the following:

![Schematic with Pins Only](../images/lab02_11.png)

!!! info "Quit Active Command"
    To quit an active command in **Virtuoso Studio**, press the ++escape++ key.

---
### Add Instance

Now, add the core of the ideal operational amplifier: a voltage-controlled voltage source (`vcvs`).

In the **Virtuoso Studio Schematic Editor** window, select:

!!! menu "Create->Instance"
    ++i++

This will open the **Add Instance** pop-up window.

Click **Browse**. In the **Library Browser** window, select:

 | Field    | Value      |
 |----------|------------|
 | Library  | analogLib  |
 | Cell     | vcvs       |
 | View     | symbol     |

Close the **Library Browser** window.

You should be left with the **Add Instance** dialog box, similar to the following:

![Add Instance](../images/lab02_12.png)

Set **Voltage Gain** to `1000000` (one million), **Maximum Output Voltage** to `1.8`, and **Minimum Output Voltage** to `0`.

Press **Enter** to close the window. You are now back in your schematic. While hovering over the schematic, you will see a yellow symbol of a `vcvs`. Move the mouse to the middle of the schematic and press the ++left-button++ to place the `vcvs`. Then, press the ++escape++ key.

You also need to add the ground symbol to the schematic. Follow the same steps as before and select:

 | Field    | Value      |
 |----------|------------|
 | Library  | analogLib  |
 | Cell     | gnd        |
 | View     | symbol     |

Place the `gnd` symbol directly below the `vcvs`.

---
### Add Wires

Now, connect the input and output pins to the `vcvs` symbol.

In the **Virtuoso Studio Schematic Editor** window, select:

!!! menu "Create->Wire (Narrow)"
    ++w++

Click on the two points you want to connect; a blue wire will appear.

??? tip "Ensure Good Wire Connection"
    When the mouse is close to a connectable object, a yellow diamond shape appears. The connection is established when a small yellow square appears in the center of the diamond shape.

    ![Wire Connection](../images/lab02_note_1.png)

When finished, use **Check and Save** to verify there are no errors or warnings.

!!! menu "File->Check and Save"
    ++shift+x++

    ![Check and Save](../images/lab02_note_2.png)

??? tip "Check and Save"
    The **Check and Save** command saves the view and also checks several rules (which can be modified to suit your needs), such as shorts, open circuits, and pin consistency across views.

    If there are errors or warnings, a pop-up window appears (errors take precedence over warnings). The information is also displayed in the **CIW**. Markers are also added in the schematic view where errors (white blinking markers) or warnings (yellow blinking markers) occur.

    To list the errors or warnings:

    !!! menu "Check->Find Marker..."
        ++g++

    A pop-up window appears with the list of errors or warnings.

    ![Find Marker](../images/lab02_note_3.png)

---
### Move Objects

??? tip "Move Objects"
    There are two modes to move objects (instance, pin, wire, etc.) in the **Virtuoso Studio Schematic Editor**: the **move** command and the **stretch** command. The **move** command moves the object without preserving its connections. The **stretch** command allows you to move an object while preserving its connections and updating the corresponding wire.

    For the **move** command:
    !!! menu "Edit->Move"
        ++shift+m++

    For the **stretch** command:
    !!! menu "Edit->Stretch"
        ++m++

---
## Symbol Creation

### Automatic Creation

In order to reuse the created block, we will need to make a symbol that can be used in other designs. In the **Virtuoso Studio Schematic Editor**, select:

!!! menu "Create->CellView->From CellView..."

This will open a **Cellview From Cellview** pop-up window. Ensure that the **Library Name** and **Cell Name** correspond to your schematic and that **To View Name** is set to `symbol`. Press **OK**.

![Cellview from Cellview](../images/lab02_13.png)

A **Symbol Generation Options** window will pop up. Ensure that the `Vin_n` and `Vin_p` inputs are specified in the **Left Pins** field and `Out` is in the **Right Pins** field, as shown in the following image:

![Symbol Generation Options](../images/lab02_14.png)

To generate the symbol using the analog standard: click on the **Load/Save** checkbox, then in the **Load/Save Symbol Template Configuration**, select `analog` from the drop-down list and click on **Load**. Press **OK** to create the symbol.

![Symbol Generation Options Animation](../images/lab02_15.png)

A **Overwrite Base Cell CDF** pop-up window appears. Press **Yes**.

![Overwrite Base Cell CDF](../images/lab02_16.png)

---
### Update the Symbol

An automatically generated rectangular symbol of your schematic appears.

![Automatic Symbol](../images/lab02_17.png)

Since we are designing an operational amplifier, we can draw a proper symbol for it.

++left-button++ click on the green rectangle and delete it:

!!! menu "Edit->Delete"
    ++del++

Now, from the menu, select:

!!! menu "Create->Shape->Line"

Draw a triangle.

Select the `Vin_p` and `Vin_n` pins by ++left-button++ clicking and dragging. Adjust the red rectangle to surround the symbol (keep-out box). You can use the [Move Objects](#move-objects) commands.

You will obtain the following symbol:

![Final Symbol](../images/lab02_18.png)

When the drawing is complete, press **Check and Save** to save the changes. You can now close the **Virtuoso Studio Symbol** window.

---
## Testbench Schematic Creation

In order to test our design, we will create a higher-level schematic.

In the **Library Manager**, select the library `MAPS_academy_lab`.

Create a new cell view from the **Library Manager**:

!!! menu "File->New->Cell View"

In the **New File** window, fill the **Cell** field with `tb_step1_idealOpAMP` and select **Type** as `schematic` (if not selected by default). The **View** field updates automatically. Press **OK** to generate the new schematic.

Add the `step1_idealOpAMP` symbol to the design in the `tb_step1_idealOpAMP` schematic:

!!! menu "Create->Instance"
    ++i++

Ensure you select the correct instance:

 | Field    | Value              |
 |----------|--------------------|
 | Library  | MAPS_academy_lab   |
 | Cell     | step1_idealOpAMP   |
 | View     | symbol             |

From the **Virtuoso Studio Schematic Editor** window, select:

!!! menu "Create->Pin"
    ++p++

This will open the **Create Pin** pop-up window. Ensure that **Direction** is set to `output`. In the **Names** field, enter `Out`. Place the pin on the schematic (on the right side of the ideal OpAMP).

---
### Add Components to Testbench

From the `analogLib` library, add a DC voltage source (`vdc`) and a `gnd` symbol to the schematic.

Select the `vdc` source to copy it:

!!! menu "Edit->Copy"
    ++c++

Do the same for the `gnd` symbol. Then, place and connect the elements as shown in the following schematic:

![Test Bench Schematic](../images/lab02_19.png)

Now, let’s change the value of the voltage connected to the `Vin_n` pin. Select the `vdc` source connected to the `Vin_n` pin:

!!! menu "Edit->Properties->Objects"
    ++q++

A window should appear:

![Edit vdc Properties](../images/lab02_20.png)

In the **DC Voltage** field, enter a value between `0` and `1.8` (for example, `0.9`). We will call this voltage the **switching voltage**. Do not set the `vdc` source connected to the `Vin_p` pin, as we will sweep it in the simulation.

---
### Name the Net

!!! menu "Create->Wire Name"
    ++l++

Enter a name for the input node (for example, `in`). Select the wire going to the `Vin_p` pin to rename it to `in`.

Press **Check and Save**.

---
## Simulation

In the **Virtuoso Studio Schematic Editor**, go to the menu:

!!! menu "Launch->ADE Explorer"

A pop-up window should appear. Select the **Create New View** radio button.

The next pop-up window will be filled in automatically, so simply press **OK**. This will open **Virtuoso ADE Explorer**, an environment where we will perform simulations.

![ADE Explorer](../images/lab02_21.png)

In the **Setup** pane on the left side, add the analysis by clicking the grayed-out field **Click to add analysis** under the **Analysis** entry.

If you close the **Setup** pane by accident, go to:

!!! menu "Window->Assistants->Setup"

A **Choosing Analyses** pop-up window will appear:

- Choose the `dc` analysis, and in the **Sweep Variable** section, click **Component Parameter**.
- The pop-up will rearrange itself. Click the **Select Component** button and choose the DC source connected to the `Vin_p` pin.

    - Another pop-up will appear with all the parameters you can select for this element.
    - From this window, select the first option: `dc` `vdc` `"DC voltage"`.
    - Click **OK** and return to the **Choosing Analyses** window.

- In the **Sweep Range** section, set **Start** to `0` and **Stop** to `1.8`. This will sweep the voltage from `0V` to `1.8V` at the `Vin_p` input of the ideal OpAMP.
- Press **OK** (or ++enter++) to close the **Choosing Analyses** window.

Go back to the **Virtuoso ADE Explorer** window by clicking on the **maestro** tab. Select the voltages to observe in the simulation:

!!! menu "Outputs->To be Plotted->Select on Design"

This will bring you to your schematic. Select the input wire (going to `Vin_p`) and the output pin (or wire).

Press ++esc++ and return to the **maestro** tab.

![Schematic Ideal OpAMP Testbench Select Nets](../images/lab02_23.png)

When back in the **Virtuoso ADE Explorer**, click on the **maestro** tab. Run the simulation:

!!! menu "Simulation->Netlist and Run"
    Or click the button from the tab on the right side.

    ![Run Simulation](../images/lab02_24.png)

    If the tab is closed by accident, you can reopen it using:

    !!! menu "Window->Toolbars->Run"

The simulation will start. Once completed, a **VIVA Graph** pane will appear on the right side of the main **ADE Explorer** window with the results.

You may notice that the value at which your comparator switches is not exactly equal to your switching voltage. This is because the simulator has automatically chosen the step size.

Go back to the **Setup** pane on the left side of **ADE Explorer** and double-click on the `dc` **Analysis**. Confirm that the **Sweep Type** is set to **Automatic**. Change it to **Linear** and set the **Step Size** to `0.1m` (i.e., 100 µV).

Press **OK** and re-run the simulation.

You can now see that your comparator will cross at the voltage around what you selected, with a precision of 100 µV.

**Excellent job! You have designed your (first?) comparator, and it is working.**

Close all the schematic and **ADE Explorer** windows. You can save changes if you wish.