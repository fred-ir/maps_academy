<!-- .slide: data-background-color="#003366" -->

# Microelectronics design concepts

Basic steps

---

## Create the desired function

- Full custom

    - Schematic with ideal components
    - Using Virtuoso schematic

- Digital

    - RTL code with SystemVerilog, VHDL, ...
    - Using any text editor

---

## Check functionality

- Full custom

    - Create a test bench and run Spice like simulations
    - Using Virtuoso Schematic, Virtuoso ADE and Spectre simulator

- Digital

    - Create a test bench in HDL code like SystemVerilog, VHDL, ...
    - Using any text editor and Xcelium simulator

---

## Map to a technology

- Full custom

    - Create a schematic with mapped transitors
    - Using Virtuoso Schematic

- Digital

    - Synthesis to standard cells in a defined technology
    - Using Genus

---

## Check functionality and performances

- Full custom

    - Rerun the previous test benches with transistor level schematics
    - Using Virtuoso ADE explorer and Spectre simulator

- Digital

    - Check logical equivalence
    - Using Conformal LEC

---

## Create masks

- Full custom

    - Draw masks to create transistors and the connections
    - Using Virtuoso Layout XL

- Digital

    - Place and route tools to place the standard cells and create the connections
    - Using Innovus

---

## Signoff physical verifications

- Full custom and digital

    - Design Rule Check (DRC) and Layout Vs. schematic (LVS)
    - Using PVS or Pegasus

---

## Signoff parasitics extractions

- Full custom and digital

    - Extract resistance and capacitance of connections, and source and drain parameters for transistors
    - Using QRC or Quantus

---

## Post layout simulations

- Full custom

    - Rerun the previous test benches with parasitics view
    - Using Spectre simulator

- Digital

    - Run Static Timing Analysis (STA) and compute delays for Standard Delay File (SDF)
    - Using Tempus
    - Rerun the previous test benches with annotated netlist (SDF)
    - Using Xcelium simulator

---

## Send to fabrication

- Full custom and digital

    - Generate GDS file and send it to the foundry
    - Wait for foundry feedback and when everything is ok the chip will be fabricated
