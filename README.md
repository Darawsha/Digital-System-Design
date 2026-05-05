# Digital System Design

A collection of RTL designs and digital circuits written in VHDL and Verilog.

This repository contains small learning projects for combinational logic, sequential logic, counters, display drivers, traffic-light control, LCD output, and VGA output. The projects are intended for study, simulation, and FPGA implementation with Xilinx Vivado.

## Table of Contents

- [Overview](#overview)
- [Project Index](#project-index)
- [How to Use](#how-to-use)
- [Tools Used](#tools-used)
- [Learning Resources](#learning-resources)
- [Security](#security)
- [License](#license)

## Overview

Each project folder contains source files, testbenches, constraints, waveform captures, Vivado project files, or supporting documentation depending on the design. Start with the smaller modules, then move toward the full FPGA-style systems.

## Project Index

| Project | Description | Key Contents |
| --- | --- | --- |
| [Adders](Adders) | Basic adder circuit implementations | Half adder, full adder, testbenches |
| [FourBitAdder](FourBitAdder) | 4-bit adder implementations | Behavioral and structural VHDL, waveforms |
| [MUX](MUX) | Multiplexer circuit design | 4-to-1 MUX and testbench |
| [Decoders](Decoders) | Binary decoder circuit design | 2-to-4 decoder and testbench |
| [AsyncRCntr](AsyncRCntr) | Asynchronous and up/down counter experiments | Ripple counter, push-button counter, BCD counter |
| [PatternCounter](PatternCounter) | Pattern detection counter | Sequential logic design and testbench |
| [Sequential](Sequential) | Sequential circuit examples | GCD ASM design and testbench |
| [Two-Digit BCD Counter](Two-Digit%20BCD%20Counter) | Two-digit BCD counter design | Counter, seven-segment decoder, time mux |
| [Traffic Light](Traffic%20Light) | Traffic light controller | ASM, countdown timer, waveform images |
| [LCD display name](LCD%20display%20name) | Simple LCD name display | LCD Verilog module and constraints |
| [LCD Driver](LCD%20Driver) | LCD countdown timer project | LCD driver, timer, clock divider, constraints |
| [LCDSlider](LCDSlider) | LCD slider/countdown timer files | LCD driver source and experiment PDF |
| [VGA controller - Color display](VGA%20controller%20-%20Color%20display) | VGA color output controller | VGA controller, clock divider, constraints, screenshot |
| [VGA controller - Image Display](VGA%20controller%20-%20Image%20Display) | VGA image display controller | VGA controller, image memory IP, COE image data |
| [VGA controller - Moving box](VGA%20controller%20-%20Moving%20box) | VGA Square display and controller | VGA controller, clock divider , BTN Debouncer, constraints |

## How to Use

1. Open the project folder you want to study.
2. Read the top-level module and identify the inputs, outputs, clocks, and reset signals.
3. Run the available testbench or inspect the included waveform images.
4. Open the Vivado project file when available to simulate, synthesize, or implement the design.
5. Use [LEARN.md](LEARN.md) for a suggested learning path through the repository.

## Tools Used

- **Xilinx Vivado** - FPGA Synthesis and Implementation
- **VHDL / Verilog** - Hardware description languages used across the projects

## Learning Resources

- [Learning Guide](LEARN.md)
- [VHDL and Verilog Tutorial](https://www.nandland.com/)

## Security

See [SECURITY.md](SECURITY.md) for vulnerability reporting and safety notes.

## License

See [LICENSE](LICENSE) for details.

---

**Author:** Darawsha
**Status:** Computer Engineer
