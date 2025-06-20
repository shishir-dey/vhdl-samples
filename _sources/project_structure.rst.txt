Project Structure
=================

Understanding the organization and architecture of the VHDL Digital Design Samples project.

.. contents:: Table of Contents
   :local:
   :depth: 2

Overview
--------

The project follows a hierarchical structure designed for educational purposes, separating source code, tests, documentation, and build scripts into logical directories.

Directory Layout
----------------

.. code-block:: text

   vhdl-samples/
   ├── 📁 src/                    # Source code (VHDL designs)
   │   ├── 📁 gates/              # Basic logic gates
   │   ├── 📁 combinational/      # Combinational circuits
   │   │   ├── 📁 adders/         # Addition circuits
   │   │   ├── 📁 decoders/       # Decoder circuits
   │   │   ├── 📁 multiplexers/   # MUX/DEMUX circuits
   │   │   ├── 📁 comparators/    # Comparison circuits
   │   │   └── 📁 shifters/       # Bit shifting circuits
   │   ├── 📁 sequential/         # Sequential circuits
   │   │   ├── 📁 flip_flops/     # Flip-flop implementations
   │   │   ├── 📁 latches/        # Latch implementations
   │   │   ├── 📁 registers/      # Register implementations
   │   │   ├── 📁 counters/       # Counter implementations
   │   │   └── 📁 state_machines/ # FSM implementations
   │   └── 📁 modules/            # Complex/mixed modules
   ├── 📁 test/                   # Test files (mirroring src/)
   │   ├── 📁 gates/
   │   ├── 📁 combinational/
   │   └── 📁 sequential/
   ├── 📁 docs/                   # Documentation (Sphinx)
   │   ├── 📁 _static/            # Static assets (CSS, images)
   │   ├── 📁 components/         # Component documentation
   │   ├── 📁 testing/            # Testing documentation
   │   └── 📁 development/        # Development guides
   ├── 📁 scripts/                # Build and utility scripts
   ├── 📁 .github/workflows/      # CI/CD workflows
   ├── 📄 Makefile                # Build system
   ├── 📄 README.md               # Project overview
   └── 📄 LICENSE                 # MIT License

Source Code Organization
------------------------

The ``src/`` directory is organized by complexity and circuit type:

Basic Gates (``src/gates/``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1
   :widths: 30 50 20

   * - File
     - Description
     - Modeling Style
   * - ``or_gate.vhd``
     - 4-input OR gate
     - Behavioral
   * - ``xor_3.vhd``
     - 3-input XOR gate
     - Dataflow
   * - ``my_xor.vhd``
     - 2-input XOR (structural)
     - Structural

Combinational Logic (``src/combinational/``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Adders (``adders/``):**

.. list-table::
   :header-rows: 1
   :widths: 35 45 20

   * - Component
     - Description
     - Key Features
   * - Half Adders
     - 1-bit addition (no carry-in)
     - Basic building block
   * - Full Adders
     - 1-bit addition (with carry)
     - Multiple implementations
   * - 4-bit Adders
     - Multi-bit arithmetic
     - Ripple carry design

**Decoders (``decoders/``):**

.. list-table::
   :header-rows: 1
   :widths: 35 45 20

   * - Component
     - Description
     - Outputs
   * - ``decoder_2x4.vhd``
     - 2-to-4 line decoder
     - 4 outputs
   * - ``decoder_3x8_str.vhd``
     - 3-to-8 decoder (structural)
     - 8 outputs

**Multiplexers (``multiplexers/``):**

.. list-table::
   :header-rows: 1
   :widths: 35 45 20

   * - Component
     - Description
     - Select Lines
   * - ``mux_2x1_df.vhd``
     - 2-to-1 MUX (dataflow)
     - 1 bit
   * - ``mux_4x1_str.vhd``
     - 4-to-1 MUX (structural)
     - 2 bits
   * - ``mux_8x1_str.vhd``
     - 8-to-1 MUX (structural)
     - 3 bits

Sequential Logic (``src/sequential/``)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Flip-Flops (``flip_flops/``):**

.. list-table::
   :header-rows: 1
   :widths: 35 45 20

   * - Component
     - Description
     - Features
   * - ``d_flip_flop.vhd``
     - D flip-flop
     - Edge-triggered
   * - ``t_flip_flop.vhd``
     - T flip-flop
     - Toggle functionality

**Registers (``registers/``):**

.. list-table::
   :header-rows: 1
   :widths: 35 45 20

   * - Component
     - Description
     - Width
   * - ``register_8_bit.vhd``
     - 8-bit register
     - 8 bits
   * - ``pipo_4bit_behave.vhd``
     - 4-bit PIPO register
     - 4 bits

Test Structure
--------------

The ``test/`` directory mirrors the ``src/`` structure:

.. code-block:: text

   test/
   ├── 📁 gates/
   │   ├── or_gate_tb.vhd         # Tests all 16 input combinations
   │   └── xor_testbench.vhd      # Tests XOR functionality
   ├── 📁 combinational/
   │   ├── 📁 adders/
   │   │   ├── fa_testbench.vhd   # Full adder tests
   │   │   ├── ha_behave_tb.vhd   # Half adder tests
   │   │   └── rc_adder_testbench.vhd  # 4-bit adder tests
   │   ├── 📁 decoders/
   │   │   └── decoder_2x4_testbench.vhd
   │   └── 📁 multiplexers/
   │       └── mux_2x1_tb.vhd
   └── 📁 sequential/
       └── 📁 flip_flops/
           └── d_flip_flop_tb.vhd

Naming Conventions
------------------

File Naming
~~~~~~~~~~~

- **Source files**: ``<component_name>.vhd``
- **Testbenches**: ``<component_name>_tb.vhd`` or ``<component_name>_testbench.vhd``
- **Entity names**: Match filename (e.g., ``or_gate`` entity in ``or_gate.vhd``)

VHDL Naming
~~~~~~~~~~~

- **Entities**: lowercase with underscores (``d_flip_flop``)
- **Architectures**: PascalCase (``Behavioral``, ``Dataflow``, ``Structural``)
- **Signals**: lowercase with underscores (``clk_signal``)
- **Ports**: uppercase (``CLK``, ``DATA_IN``, ``OUTPUT``)

Build System Architecture
-------------------------

The project uses a multi-layered build system:

.. mermaid::

   graph TD
       A[Developer] --> B[Makefile]
       B --> C[Test Scripts]
       B --> D[Build Scripts]
       B --> E[Documentation]
       
       C --> F[GHDL Compiler]
       D --> F
       E --> G[Sphinx]
       
       F --> H[Simulation Results]
       G --> I[HTML Documentation]
       
       J[GitHub Actions] --> B
       J --> K[Deploy to Pages]

Makefile Targets
~~~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1
   :widths: 25 55 20

   * - Target
     - Description
     - Usage
   * - ``test``
     - Run all tests
     - ``make test``
   * - ``test-gates``
     - Test basic gates only
     - ``make test-gates``
   * - ``test-<component>``
     - Test specific component
     - ``make test-or-gate``
   * - ``build``
     - Syntax check all files
     - ``make build``
   * - ``stats``
     - Show project statistics
     - ``make stats``
   * - ``clean``
     - Remove build artifacts
     - ``make clean``

Documentation Architecture
--------------------------

Sphinx-based documentation system:

.. code-block:: text

   docs/
   ├── 📄 conf.py                 # Sphinx configuration
   ├── 📄 index.rst               # Main documentation page
   ├── 📄 installation.rst        # Installation guide
   ├── 📄 quickstart.rst          # Quick start guide
   ├── 📁 components/             # Component documentation
   │   ├── gates.rst
   │   ├── combinational.rst
   │   └── sequential.rst
   ├── 📁 testing/                # Testing documentation
   └── 📁 development/            # Development guides

Dependencies and Tools
----------------------

Core Dependencies
~~~~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1
   :widths: 20 30 30 20

   * - Tool
     - Purpose
     - Version
     - Required
   * - GHDL
     - VHDL compiler/simulator
     - 5.0.1+
     - Yes
   * - Make
     - Build automation
     - 3.81+
     - Yes
   * - Git
     - Version control
     - 2.0+
     - Yes

Documentation Dependencies
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1
   :widths: 25 40 20 15

   * - Package
     - Purpose
     - Version
     - Required
   * - Sphinx
     - Documentation generator
     - 7.0.0+
     - Yes
   * - Read the Docs Theme
     - Documentation theme
     - 2.0.0+
     - Yes
   * - MyST Parser
     - Markdown support
     - 2.0.0+
     - Optional

CI/CD Pipeline
--------------

The project uses GitHub Actions for continuous integration:

.. mermaid::

   graph LR
       A[Git Push] --> B[GitHub Actions]
       B --> C[Install GHDL]
       B --> D[Install Python]
       C --> E[Run Tests]
       D --> F[Build Docs]
       E --> G[Test Results]
       F --> H[Deploy to Pages]

Workflow Files
~~~~~~~~~~~~~~

.. list-table::
   :header-rows: 1
   :widths: 30 50 20

   * - File
     - Purpose
     - Triggers
   * - ``.github/workflows/test.yml``
     - Run VHDL tests
     - Push/PR
   * - ``.github/workflows/docs.yml``
     - Build/deploy docs
     - Push to main

Scalability Considerations
---------------------------

Design for Growth
~~~~~~~~~~~~~~~~~

The structure is designed to accommodate:

- **New component categories**: Add directories under ``src/``
- **More complex designs**: Use ``src/modules/`` for mixed designs
- **Extended testing**: Parallel test structure in ``test/``
- **Documentation expansion**: Modular Sphinx documentation

Best Practices
~~~~~~~~~~~~~~

1. **Separation of Concerns**: Clear boundaries between source, tests, and docs
2. **Consistent Naming**: Follow established conventions
3. **Modular Design**: Each component is self-contained
4. **Comprehensive Testing**: Every component should have tests
5. **Living Documentation**: Keep docs synchronized with code

Navigation Tips
---------------

**Finding Components:**

.. code-block:: bash

   # Find all adders
   find src/ -name "*adder*"
   
   # Find all testbenches
   find test/ -name "*tb.vhd"
   
   # Count files by category
   find src/gates/ -name "*.vhd" | wc -l

**Understanding Dependencies:**

.. code-block:: bash

   # Search for component usage
   grep -r "component.*mux_2x1" src/
   
   # Find entity definitions
   grep -r "entity.*is" src/

**Project Statistics:**

.. code-block:: bash

   # Quick overview
   make stats
   
   # Detailed analysis
   find . -name "*.vhd" -exec wc -l {} + | sort -n

This structure provides a solid foundation for learning VHDL while maintaining professional organization and scalability. 