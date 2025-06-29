# Ideal CSA with feedback resistor

## Schematic

For this step we will reuse the design of the `step2_idealCSA`.

Please open to the schematic of the `step2_idealCSA`

!!! menu "File->Save a Copy..."
    ++ctrl+s++

In the pop-up window that appears give the new `Cell Name` `step3_idealCSA_Rf` and press `OK`.

Close the `step2_idealCSA` schematic and open the newly created `step3_idealCSA_Rf`.

Add a feedback resistor to the schematic by pressing ++i++ shortcut.

| Parameter   | Value         |
|-------------|---------------|
| Library     | `analogLib`   |
| Cell        | `res`         |
| View        | `symbol`      |

In the `Add Instance` pop-up window that opens, for the resistance value give `Rf`.

It will be our second parameter. While hovering your mouse over the schematic, the resistor appears in yellow. At this moment you can click the ++middle-button++ to turn it 90°.

Do turn the resistor, and place it in parallel with the feedback capacitor of your CSA, make the connections.

!!! menu "Create->Wire Narrow"
    ++w++

At this moment, we can also change the repetition rate of our `ipulse` source.

Select the input current source and click ++q++.

Change the `Period` field to 5u.

Confirm with pressing the `OK` button (or ++enter++).

Finish the modifications by doing a `Check and Save`.

## Test bench

### Transient simulation

Go to:

!!! menu "Launch->ADE Explorer"

A pop-up window should appear. Select `Create New View`. The next pop-up window will be filled-in automatically, so we can just press `OK`.

When the `Virtuoso ADE Explorer` is open add a 20 µs transient analysis and copy the `Design Variables` from the `CellView`.

Set the `Qin` to 1000 and `Rf` to 10M.

Select the output of our CSA to plot:

!!! menu "Outputs->To be Plotted->Select On Design"

Finally `Run` the simulation.

You can see now that the feedback resistor resetting the feedback capacitor and the voltage returns to the initial value after each current pulse.

### Gain and noise

Let’s calculate the gain and noise of this solution.

For this we have to add another analysis. Click on the `Setup` pane of the `ADE Explorer` on the `Click to add analysis` and choose `noise`.

For the `Sweep Range`, select 1 for the `Start` and 1G for the `Stop`.

In the `Output Noise` part change the `probe` to `voltage`.

Change `Positive Output Node` to `out` (select → out).

Change `Negative Output Node` to `gnd!`.

For the Input noise change `Port` to `current` and click `Select` to select the input current source on the schematic.

When you’ve selected the input current source, go back to the `Choosing Analyses` window and press `OK`.

Go back to the `maestro` tab.

Now that we have our analyses set, let’s add the expressions to calculate the noise, and gain automatically.

In the `Virtuoso ADE Explorer`, go to the menu:

!!! menu "Outputs->Add->Expression"

This wil add another entry in the `Outputs Setup` list in the middle of the screen.

![Output Setup maestro tab](../images/lab04_1.png)

Double click in the `Name` field and put: rmsNoise. Then in the `Details` field put: `rmsNoise(1 1G)`. This will calculate the root mean square of the noise at the output node (that we’ve selected in the noise analysis).

Add another expression to the `Outputs Setup` list and in the `Name` field enter: `amplitude`. In the `Details` field put: `ymax(VT("/out"))- ymin(VT("/out"))`.

Make sure that the `“/out”` corresponds to your output pin (case sensitive). This will calculate the difference between the maximum and minimum values of the `out` signal, so in our case an approximation of the amplitude.
You need to add two more expressions as in the following table.

| `Name` | `Details`                 |
|--------|---------------------------|
| gain   | amplitude / VAR("Qin")    |
| ENC    | rmsNoise / gain           |

Run your simulation to test if the expressions work. The values of the expressions should be printed after the simulation finishes:

![Output Setup maestro tab finish](../images/lab04_2.png)

The `gain` is calculated in `[V/e-]` and `ENC` (Equivalent Noise Charge) is in `[e-]`. As you have noticed that for calculation of the gain we have used a `VAR(“Qin”)`, which is the Virtuoso way of using the `Qin` parameter declared in the `Design Variables` section.

If any of the Values calculated give `eval err` in red, make sure that the formulas in the `Details` fields are correct.

### Linearity

Now let’s do a parametric simulation to observe the linearity of our CSA.

In the `Virtuoso ADE Explorer` main window, go to the `Setup` pane on the left side. In the `Design Variables` subsection find the `Qin`, that we have declared previously. Double click on its value (was set to 1000), a button with three dots will appear by clicking on it a `Parametrize` pop-up window will appear.

![Parametrize](../images/lab04_3.png)

Press `Delete Spec`, followed by `Add Specification` and `From/To`. Enter the following values: `From`: 100, `To`: 50k, `Total Steps`: 20 and press `Ok` button.

Now when run your simulation, the simulator will perform 20 steps with the input charge from 100 e- to 50ke-.

Run the simulation and wait for the results.

When simulation is done, you will see `rmsNoise`, `amplitude`, `gain` and `ENC` curves on the same plot. Do a ++right-button++ click on the plot and choose:

!!! rmb "Split Current Strip->trace"

This will allow you to view the expressions on separate plots.

Next to the expression plots, you should also see the Transient response plot of the voltage at the `out` node for all the 20 steps. You can zoom in by clicking ++right-button++ and dragging the mouse over. You can go back to viewing the whole plot by pressing `f` on your keyboard. You can also zoom in/out by turning the mouse wheel while holding ++shift++ key (horizontal zoom) or ++ctrl++ key (vertical zoom).

### Feedback resistor

Let’s now perform a simulation with different values of the feedback resistor `Rf`. Change the value of the `Qin` design variable back to 1000 (do this simply by double clicking the `Qin` formula and replacing it with 1000).

Now change the `Rf` value as in the previous step (double click => 3 dots button => Parametrize window).

This time in the `From/To sweep`, we will change the `Step Type` from `Auto` to `Decade`. Enter the following values:

| Parameter        | Value    |
|------------------|----------|
| `From`           | 1M       |
| `To`             | 1G       |
| `Steps/Decade`   | 10       |

Press `Ok` button.

Now when run your simulation, the simulator will perform 31 steps with the `Rf` values changed 10 times per decade. Run the simulation and wait for the results.

Split the expression plot as before and double click the `Rf` at the `X` axis. This will open a `Independent Axis Properties` window, where you go to `Scale` tab and tick the `Log` in the `Scale Options`. Press `OK` to close the window. You should see similar plots to the following.

![ideal CSA plots](../images/lab04_4.png)

The Transient Response window will show you that setting the high `Rf` value, while good for the `ENC`, will slow down your front-end and may cause pile-up problems.

You can change the `Qin` to a different value and re-run the parametric simulation to see the effects.

When you’re done, you can close the `Virtuoso ADE` window saving any changes.
