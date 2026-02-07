# Digital System Design

A collection of RTL designs and digital circuits implemented in VHDL.

## 📚 Modules

### Combinational Logic
- **Adders** - Half Adder, Full Adder
- **MUX** - 4-to-1 Multiplexer
- **Decoders** - 2-to-4 Decoder

### Sequential Logic
- **Sequential** - GCD Finite State Machine
- **PatternCounter** - Pattern Detection FSM

### Projects
- **FourBitAdder** - 4-bit Ripple Carry Adder (Vivado Project)

## 📁 Repository Structure

```
Digital-System-Design/
├── Adders/
│   ├── half_adder.vhd
│   ├── half_adder_tb.vhd
│   ├── full_adder.vhd
│   ├── full_adder_tb.vhd
│   └── waveforms/
├── MUX/
│   ├── mux4to1.vhd
│   ├── mux4to1_tb.vhd
│   └── waveforms/
├── Decoders/
│   ├── decoder2to4.vhd
│   ├── decoder2to4_tb.vhd
│   └── waveforms/
├── Sequential/
│   ├── GCD_ASM.vhd
│   ├── GCD_ASM_tb.vhd
│   └── waveforms/
├── PatternCounter/
│   ├── pattern_counter.vhd
│   ├── pattern_counter_tb.vhd
│   └── waveforms/
├── FourBitAdder/          # Vivado project
├── Documentation/          # Design diagrams
└── Notes/                 # Learning notes
```

## � Tools Used

- **GHDL** - VHDL Simulator
- **GTKWave** - Waveform Viewer
- **Xilinx Vivado** - FPGA Synthesis and Implementation

## 🚀 How to Simulate

### Using GHDL

1. **Compile the design:**
   ```bash
   ghdl -a half_adder.vhd
   ghdl -a half_adder_tb.vhd
   ```

2. **Elaborate:**
   ```bash
   ghdl -e half_adder_tb
   ```

3. **Run simulation:**
   ```bash
   ghdl -r half_adder_tb --vcd=half_adder.vcd
   ```

4. **View waveform:**
   ```bash
   gtkwave half_adder.vcd
   ```

## � Learning Resources

- [GHDL Documentation](https://ghdl.readthedocs.io/)
- [VHDL Tutorial](https://www.nandland.com/)
- [GTKWave User Guide](http://gtkwave.sourceforge.net/)

## � Notes

See the `Notes/` folder for learning notes and design decisions.

## 📄 License

See [LICENSE](LICENSE) for details.

---

**Author:** OMDEH  
**Status:** Student Project - 4th Year Engineering

