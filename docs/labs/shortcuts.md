# Keyboard Shortcuts for Cadence Virtuoso

*Organized by usage mode: Schematic, Layout, Simulation*

---

## 📐 Schematic Mode Shortcuts

| Shortcut       | Command/Action               | Description                                                                                     |
|-----------------|-------------------------------|-------------------------------------------------------------------------------------------------|
| ++i++           | `Create->Instance`            | Adds an instance (e.g., `vcvs`, `res`, `nfet_01v8`).                                             |
| ++p++           | `Create->Pin`                 | Opens the **Pin Creation** window (for input/output pins).                                       |
| ++w++           | `Create->Wire (Narrow)`        | Creates an electrical wire between two points.                                                 |
| ++q++           | `Edit->Properties->Objects`   | Opens the properties of the selected object (e.g., modify `Period`, `Voltage Gain`, etc.).     |
| ++esc++         | Cancel Current Command        | Cancels the current command (e.g., pin, wire, or instance placement).                          |
| ++del++         | `Edit->Delete`                | Deletes the selected object (instance, pin, wire).                                             |
| ++f3++          | Toggle Pop-up Window           | Shows or hides the active pop-up window (e.g., `Create Pin`, `Add Instance`).                    |
| ++c++           | `Edit->Copy`                  | Copies the selected object (e.g., `vdc` or `gnd` source).                                         |
| ++l++           | `Create->Wire Name` / `Create->Label` | Creates a **label** for a node or wire (e.g., `net5`, `in`).                                   |
| ++shift+x++     | `File->Check and Save`        | Checks for errors and saves the schematic.                                                      |
| ++m++           | `Edit->Move` (Schematic)      | Moves an object **without preserving connections**.                                           |
| ++shift+m++     | `Edit->Move` (Alternative)     | Alternative shortcut to move an object.                                                         |
| ++left-button++ | Click/Place Object            | Places an object (pin, instance, wire) at the cursor location.                                  |

---

## 🏗️ Layout Mode Shortcuts

| Shortcut       | Command/Action               | Description                                                                                     |
|-----------------|-------------------------------|-------------------------------------------------------------------------------------------------|
| ++f++           | Zoom Out (Full View)          | Displays the full layout view.                                                                   |
| ++shift+f++     | Enable Layout View           | Enables the layout view if transistors are not visible.                                        |
| ++k++           | Measure Distance              | Displays a ruler between two edges to verify design constraints (e.g., 0.14 µm spacing).   |
| ++shift+k++     | Remove All Rulers             | Removes all displayed measurement rulers.                                                     |
| ++r++           | Create Rectangle (`nwell drw`) | Draws a rectangle to connect areas (e.g., NWELL).                                              |
| ++f4++          | Toggle Full/Partial Select     | Switches between `(F)Select` (Full Select Mode) and `(P)Select` (Partial Select Mode).            |
| ++s++           | `Edit->Stretch`               | Stretches an object (e.g., rectangle, wire) **while preserving connections**.            |
| ++m++           | `Edit->Move` (Layout)         | Moves an object (pin, rectangle) **without stretching**.                                       |
| ++ctrl+d++      | Deselect All                  | Deselects all currently selected objects.                                                      |
| ++u++           | Undo Last Action              | Undoes the last modification (e.g., rectangle placement).                                    |
| ++shift+u++     | Redo Last Action              | Redoes the last undone action.                                                                  |
| ++e++           | `Options->Display`            | Opens display options (e.g., show pin names).                                                   |
| ++right-button++| Zoom In / Rectangle Selection | Zooms into a specific area or selects a rectangular region.                                      |
| ++middle-button++ | Rotate 90°                 | Rotates the selected object (e.g., resistor) by 90°.                                           |

---

## 📊 Simulation Mode Shortcuts (ADE Explorer / VIVA)

| Shortcut       | Command/Action               | Description                                                                                     |
|-----------------|-------------------------------|-------------------------------------------------------------------------------------------------|
| ++g++           | `Check->Find Marker...`        | Displays a list of **errors** (white blinking markers) or **warnings** (yellow blinking markers). |
| ++f++           | Return to Full View (Plots)   | Returns to the full view of a graph in **VIVA**.                                                 |
| ++shift++ + **Mouse Wheel** | Horizontal Zoom (Plots) | Horizontally zooms in/out on a graph while holding ++shift++ and using the mouse wheel.           |
| ++ctrl++ + **Mouse Wheel**  | Vertical Zoom (Plots)   | Vertically zooms in/out on a graph while holding ++ctrl++ and using the mouse wheel.             |
| ++right-button++| Zoom into Area / Select Trace  | Zooms into a specific area or selects a trace in a graph.                                         |

---

## 🔹 General Shortcuts (Common Across Modes)

| Shortcut       | Action                        | Description                                                                                     |
|-----------------|-------------------------------|-------------------------------------------------------------------------------------------------|
| ++left-button++ | Click/Place                   | Places an object (pin, instance, wire, rectangle) or selects an element.                         |
| ++esc++         | Cancel Current Command        | Cancels the current command (e.g., placement, stretching, selection).                        |
| ++ctrl+s++      | `File->Save a Copy...`        | Saves a copy of the schematic or layout under a new name.                                       |

---

## 📌 Important Notes

1. **Context-Dependent Behavior**:
   Some shortcuts (e.g., ++m++) behave differently depending on the mode (**Schematic** vs **Layout**).
   - In **Schematic**, ++m++ moves an object **without preserving connections**.
   - In **Layout**, ++m++ moves an object **without stretching**.

2. **Full vs. Partial Selection**:
   In **Layout** mode, use ++f4++ to toggle between:
   - `(F)Select`: **Full Select Mode** (entire object is selected).
   - `(P)Select`: **Partial Select Mode** (only edges or part of the object is selected).

3. **Design Rule Checking**:
   - Use ++k++ to measure critical distances (e.g., 0.14 µm between `metal1` tracks).
   - Use ++shift+k++ to clear all displayed rulers.

4. **Zoom and Navigation**:
   - ++right-button++ + drag: Zoom into a rectangular area.
   - ++shift+f++: Enable **Layout View** if transistors are not visible.
