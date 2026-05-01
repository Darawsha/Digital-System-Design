# Learning Guide

This repository is a collection of small digital system design projects using VHDL, Verilog, and Xilinx Vivado. Use this guide as a suggested path for studying the designs and building confidence with RTL development.

## Recommended Path

1. Start with [Adders](Adders) to review basic combinational logic.
2. Study [MUX](MUX) and [Decoders](Decoders) to practice data selection and binary decoding.
3. Move to [FourBitAdder](FourBitAdder) to see how smaller modules can be connected into a larger design.
4. Review [Sequential](Sequential) and [PatternCounter](PatternCounter) to learn state-based design and testbenches.
5. Explore [AsyncRCntr](AsyncRCntr) to compare asynchronous counters, push-button control, and BCD counting.
6. Study [Two-Digit BCD Counter](Two-Digit%20BCD%20Counter) and [Traffic Light](Traffic%20Light) for complete FPGA-style systems.
7. Finish with the LCD and VGA projects to practice display interfaces and timing-driven designs.

## How to Study Each Project

- Read the top-level module first.
- Identify the inputs, outputs, clock, and reset behavior.
- Trace how submodules are connected.
- Run or inspect the testbench when one is available.
- Check waveform images or simulation output to confirm the expected behavior.
- Open the Vivado project when available and review constraints before synthesis.

## Practice Checklist

- Explain the purpose of each signal in the top-level design.
- Draw the block diagram before reading every source file.
- Modify one parameter, counter limit, or display value and resimulate.
- Add or improve a testbench for one module.
- Compare behavioral and structural implementations where both exist.

## Tools

- Xilinx Vivado for project management, simulation, synthesis, and implementation.
- A waveform viewer for checking timing and signal behavior.
- Markdown notes for documenting observations and design decisions.

## Learning Resources

- [Nandland VHDL and Verilog Tutorials](https://www.nandland.com/)
- [Vivado Design Suite Documentation](https://docs.amd.com/)
