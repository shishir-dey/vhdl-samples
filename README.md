# VHDL Digital Design Samples

A comprehensive collection of VHDL designs for digital circuits, organized by category and featuring a complete test suite with automated CI/CD.

## 📁 Project Structure

```
vhdl-samples/
├── src/                           # Source code organized by category
│   ├── gates/                     # Basic logic gates
│   │   ├── or_gate.vhd
│   │   ├── my_xor.vhd
│   │   └── xor_3.vhd
│   ├── combinational/             # Combinational logic circuits
│   │   ├── adders/                # Various adder implementations
│   │   │   ├── fa_behaviour.vhd
│   │   │   ├── fa_dataflow.vhd
│   │   │   ├── fa_structural.vhd
│   │   │   ├── ha_behave.vhd
│   │   │   ├── half_adder.vhd
│   │   │   ├── rc_adder_4bit.vhd
│   │   │   └── adder_subtractor_4bit.vhd
│   │   ├── decoders/              # Decoder circuits
│   │   │   ├── decoder_2x4.vhd
│   │   │   └── decoder_3x8_str.vhd
│   │   ├── multiplexers/          # Multiplexer circuits
│   │   │   ├── mux_2x1_df.vhd
│   │   │   ├── mux_4x1_str.vhd
│   │   │   └── mux_8x1_str.vhd
│   │   ├── comparators/           # Comparator circuits
│   │   │   ├── one_bit_comp.vhd
│   │   │   └── three_bit_comp.vhd
│   │   └── shifters/              # Barrel shifters and bit shifters
│   │       ├── barrel_shifter.vhd
│   │       ├── shifter_8_bit_behav.vhd
│   │       └── shifter.vhd
│   ├── sequential/                # Sequential logic circuits
│   │   ├── flip_flops/            # Flip-flop implementations
│   │   │   ├── d_flip_flop.vhd
│   │   │   └── t_flip_flop.vhd
│   │   ├── latches/               # Latch implementations
│   │   │   └── sr_latch.vhd
│   │   ├── registers/             # Register implementations
│   │   │   ├── pipo_4bit_behave.vhd
│   │   │   ├── pipo_register_dff.vhd
│   │   │   └── register_8_bit.vhd
│   │   ├── counters/              # Counter implementations
│   │   │   ├── mod_5_counter.vhd
│   │   │   └── mod_counter_3_12.vhd
│   │   └── state_machines/        # Finite state machines
│   │       ├── fsm_even_sequence.vhd
│   │       └── state_diagram.vhd
│   └── modules/                   # Complex digital modules
├── test/                          # Comprehensive test suite
│   ├── gates/                     # Gate tests
│   │   ├── or_gate_tb.vhd
│   │   └── xor_testbench.vhd
│   ├── combinational/             # Combinational logic tests
│   │   ├── adders/
│   │   │   ├── fa_testbench.vhd
│   │   │   ├── ha_behave_tb.vhd
│   │   │   └── rc_adder_testbench.vhd
│   │   ├── decoders/
│   │   │   └── decoder_2x4_testbench.vhd
│   │   └── multiplexers/
│   │       └── mux_2x1_tb.vhd
│   └── sequential/                # Sequential logic tests
│       └── flip_flops/
│           └── d_flip_flop_tb.vhd
├── scripts/                       # Build and test scripts
│   └── run_tests.sh              # Automated test runner
└── .github/workflows/            # CI/CD configuration
    └── test.yml                  # GitHub Actions workflow
```

## 🚀 Quick Start

### Prerequisites

- **GHDL**: VHDL simulator and compiler
  
  **On macOS:**
  ```bash
  brew install ghdl
  ```
  
  **On Ubuntu/Debian:**
  ```bash
  sudo apt-get install ghdl
  ```

### Running Tests

1. Clone the repository:
   ```bash
   git clone https://github.com/shishir-dey/vhdl-samples.git
   cd vhdl-samples
   ```

2. Run the complete test suite:
   ```bash
   ./scripts/run_tests.sh
   ```

3. Run individual tests:
   ```bash
   # Test a specific component
   ghdl -a src/gates/or_gate.vhd
   ghdl -a test/gates/or_gate_tb.vhd
   ghdl -e or_gate_tb
   ghdl -r or_gate_tb
   ```

## 📋 Component Categories

### 🔧 Basic Gates
- **OR Gate**: 4-input OR gate with behavioral modeling
- **XOR Gates**: Multiple XOR gate implementations

### ⚡ Combinational Logic

#### Adders
- **Half Adder**: Single-bit addition
- **Full Adder**: Multiple implementations (behavioral, dataflow, structural)
- **Ripple Carry Adder**: 4-bit ripple carry adder
- **Adder/Subtractor**: 4-bit adder-subtractor circuit

#### Decoders
- **2x4 Decoder**: 2-to-4 line decoder with enable
- **3x8 Decoder**: 3-to-8 line decoder (structural)

#### Multiplexers
- **2x1 MUX**: Basic 2-to-1 multiplexer
- **4x1 MUX**: 4-to-1 multiplexer (structural implementation)
- **8x1 MUX**: 8-to-1 multiplexer

#### Comparators
- **1-bit Comparator**: Single-bit magnitude comparator
- **3-bit Comparator**: 3-bit magnitude comparator

#### Shifters
- **Barrel Shifter**: High-speed bit shifting
- **8-bit Shifter**: Behavioral 8-bit shifter

### 🔄 Sequential Logic

#### Flip-Flops
- **D Flip-Flop**: Edge-triggered D flip-flop
- **T Flip-Flop**: Toggle flip-flop

#### Latches
- **SR Latch**: Set-Reset latch

#### Registers
- **PIPO Register**: Parallel-in parallel-out register (4-bit)
- **8-bit Register**: General purpose 8-bit register
- **DFF-based Register**: Register using D flip-flops

#### Counters
- **Mod-5 Counter**: Modulo-5 counter
- **Mod-12 Counter**: 3-bit modulo-12 counter

#### State Machines
- **Even Sequence FSM**: Finite state machine for even sequence detection
- **State Diagram**: General state machine implementation
