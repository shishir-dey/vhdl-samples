Quick Start Guide
=================

Get up and running with VHDL Digital Design Samples in just a few minutes!

⚡ 5-Minute Setup
=================

**Prerequisites:** Git and terminal access

1. **Clone and enter the project:**

   .. code-block:: bash

      git clone https://github.com/shishir-dey/vhdl-samples.git
      cd vhdl-samples

2. **Install GHDL:**

   .. tabs::

      .. tab:: macOS

         .. code-block:: bash

            brew install ghdl

      .. tab:: Ubuntu/Debian

         .. code-block:: bash

            sudo apt-get install ghdl

      .. tab:: Windows

         Use WSL and follow Ubuntu instructions

3. **Run your first test:**

   .. code-block:: bash

      make test

   Expected output:

   .. code-block:: text

      🎉 All tests passed!
      Total Tests: 8, Passed: 8, Failed: 0

🚀 Your First VHDL Component
============================

Let's examine and test a simple OR gate:

1. **Look at the source code:**

   .. code-block:: bash

      cat src/gates/or_gate.vhd

   .. code-block:: vhdl

      entity or_gate is
          Port ( A : in STD_LOGIC;
                 B : in STD_LOGIC;
                 C : in STD_LOGIC;
                 D : in STD_LOGIC;
                 O : out STD_LOGIC);
      end or_gate;

      architecture Behavioral of or_gate is
      begin
          O <= A or B or C or D;
      end Behavioral;

2. **Check the testbench:**

   .. code-block:: bash

      cat test/gates/or_gate_tb.vhd

3. **Run the specific test:**

   .. code-block:: bash

      make test-or-gate

   .. code-block:: text

      Testing: or_gate_tb
      ✓ Test passed

🧪 Explore Different Categories
===============================

Test components by category:

Basic Gates
-----------

.. code-block:: bash

   make test-gates
   # Tests: OR gate, XOR gates

Combinational Logic
-------------------

.. code-block:: bash

   make test-combinational
   # Tests: Adders, Decoders, Multiplexers

Sequential Logic
----------------

.. code-block:: bash

   make test-sequential
   # Tests: Flip-flops, Registers

📊 Project Overview
===================

.. code-block:: bash

   make stats

Sample output:

.. code-block:: text

   VHDL Digital Design Samples - Project Statistics
   ================================================
   
   Directory Structure:
   📁 src/
   ├── 📁 gates/ (3 files)
   ├── 📁 combinational/ (19 files)
   └── 📁 sequential/ (10 files)
   
   📁 test/ (8 files)
   
   Lines of Code: 1,754
   Components: 32
   Test Coverage: 25%

🎯 Next Steps
=============

Now that you're set up, here are some things to try:

Learn the Architecture
----------------------

1. **Explore the project structure:**

   .. code-block:: bash

      tree src/

2. **Read component documentation:**

   - :doc:`components/gates` - Basic logic gates
   - :doc:`components/combinational` - Adders, decoders, multiplexers
   - :doc:`components/sequential` - Flip-flops, registers, counters

Try Different Components
------------------------

**Test a more complex component:**

.. code-block:: bash

   # Test a 4-bit ripple carry adder
   make test-rc-adder
   
   # Test a 2x4 decoder
   make test-decoder
   
   # Test a D flip-flop
   make test-dff

**Examine the VHDL code:**

.. code-block:: bash

   # Look at different modeling styles
   cat src/combinational/adders/fa_behaviour.vhd    # Behavioral
   cat src/combinational/adders/fa_dataflow.vhd     # Dataflow
   cat src/combinational/adders/fa_structural.vhd   # Structural

Build Your Own
--------------

1. **Create a new component:**

   .. code-block:: bash

      cp src/gates/or_gate.vhd src/gates/my_gate.vhd
      # Edit the file to implement your logic

2. **Create a testbench:**

   .. code-block:: bash

      cp test/gates/or_gate_tb.vhd test/gates/my_gate_tb.vhd
      # Modify to test your component

3. **Test your component:**

   .. code-block:: bash

      # Manual testing
      cd work/
      ghdl -a ../src/gates/my_gate.vhd
      ghdl -a ../test/gates/my_gate_tb.vhd
      ghdl -e my_gate_tb
      ghdl -r my_gate_tb

Understand the Testing Framework
--------------------------------

**Test script details:**

.. code-block:: bash

   cat scripts/run_tests.sh

**Manual testing workflow:**

.. code-block:: bash

   # Navigate to work directory
   cd work/
   
   # Compile source
   ghdl -a ../src/gates/or_gate.vhd
   
   # Compile testbench
   ghdl -a ../test/gates/or_gate_tb.vhd
   
   # Elaborate
   ghdl -e or_gate_tb
   
   # Run simulation
   ghdl -r or_gate_tb

🔧 Development Workflow
=======================

The typical development cycle:

1. **Edit code** in your favorite editor
2. **Test changes** with ``make test``
3. **Check specific components** with ``make test-<component>``
4. **Build all** with ``make build``
5. **Clean up** with ``make clean``

💡 Tips and Tricks
==================

Performance
-----------

.. code-block:: bash

   # Use parallel builds
   export MAKEFLAGS=-j$(nproc)  # Linux
   export MAKEFLAGS=-j$(sysctl -n hw.ncpu)  # macOS

Editor Setup
------------

**VS Code:** Install "VHDL Language Support" extension

**Vim:** Add to ``.vimrc``:

.. code-block:: vim

   au BufNewFile,BufRead *.vhd set filetype=vhdl

Debugging
---------

.. code-block:: bash

   # Verbose GHDL output
   ghdl -r testbench --wave=output.ghw
   
   # View waveforms (if gtkwave is installed)
   gtkwave output.ghw

🆘 Troubleshooting
==================

Common Issues
-------------

**"GHDL not found"**

.. code-block:: bash

   # Check installation
   which ghdl
   ghdl --version

**"Permission denied"**

.. code-block:: bash

   # Make scripts executable
   chmod +x scripts/run_tests.sh

**"Test failed"**

.. code-block:: bash

   # Run individual test for details
   cd work/
   ghdl -a ../src/gates/or_gate.vhd
   ghdl -a ../test/gates/or_gate_tb.vhd
   ghdl -e or_gate_tb
   ghdl -r or_gate_tb --wave=debug.ghw

Getting Help
------------

- 📖 **Documentation**: Browse the full docs at :doc:`index`
- 🐛 **Issues**: `GitHub Issues <https://github.com/shishir-dey/vhdl-samples/issues>`_
- 💡 **Contributing**: :doc:`development/contributing`

🎉 What's Next?
===============

Congratulations! You now have a working VHDL development environment. Here are some learning paths:

**For Beginners:**
- Start with :doc:`components/gates`
- Learn about :doc:`testing/framework`
- Try modifying existing components

**For Intermediate Users:**
- Explore :doc:`components/combinational`
- Study different VHDL modeling styles
- Implement your own components

**For Advanced Users:**
- Dive into :doc:`components/sequential`
- Set up :doc:`development/build_system`
- Contribute to the project via :doc:`development/contributing`

Ready to dive deeper? Head to the :doc:`components/gates` documentation! 