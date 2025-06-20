Installation Guide
==================

This guide will help you set up the VHDL Digital Design Samples project on your local machine.

Prerequisites
-------------

Before you begin, ensure you have the following installed:

System Requirements
~~~~~~~~~~~~~~~~~~~

- **Operating System**: macOS, Linux (Ubuntu/Debian), or Windows with WSL
- **Memory**: At least 2GB RAM
- **Storage**: 100MB free space
- **Internet**: Required for downloading dependencies

Required Software
~~~~~~~~~~~~~~~~~

1. **Git** (for cloning the repository)
2. **GHDL** (VHDL simulator and compiler)
3. **Make** (build system)
4. **Python 3.7+** (for documentation, optional)

Installation Steps
------------------

Step 1: Clone the Repository
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

   git clone https://github.com/shishir-dey/vhdl-samples.git
   cd vhdl-samples

Step 2: Install GHDL
~~~~~~~~~~~~~~~~~~~~

**On macOS (using Homebrew):**

.. code-block:: bash

   # Install Homebrew if you don't have it
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   
   # Install GHDL
   brew install ghdl

**On Ubuntu/Debian:**

.. code-block:: bash

   sudo apt-get update
   sudo apt-get install ghdl

**On Windows (using WSL):**

First, install Windows Subsystem for Linux (WSL), then follow the Ubuntu instructions.

**Verify Installation:**

.. code-block:: bash

   ghdl --version

You should see output similar to:

.. code-block:: text

   GHDL 5.0.1 (4.1.0.r602.g37ad91899) [Dunoon edition]

Step 3: Verify Make
~~~~~~~~~~~~~~~~~~~

Check if Make is installed:

.. code-block:: bash

   make --version

If not installed:

**On macOS:**

.. code-block:: bash

   xcode-select --install

**On Ubuntu/Debian:**

.. code-block:: bash

   sudo apt-get install build-essential

Step 4: Test the Installation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Run the project's test suite to verify everything is working:

.. code-block:: bash

   make test

Expected output:

.. code-block:: text

   ✓ GHDL found: GHDL 5.0.1 (4.1.0.r602.g37ad91899) [Dunoon edition]
   Running complete test suite...
   ==================================================
              VHDL Test Suite Runner
   ==================================================
   
   === Testing gates ===
   Testing: or_gate_tb
   ✓ Test passed
   Testing: xor_testbench  
   ✓ Test passed
   
   === Testing combinational ===
   Testing: decoder_2x4_testbench
   ✓ Test passed
   Testing: mux_2x1_tb
   ✓ Test passed
   Testing: fa_testbench
   ✓ Test passed
   Testing: ha_behave_tb
   ✓ Test passed
   Testing: rc_adder_testbench
   ✓ Test passed
   
   === Testing sequential ===
   Testing: d_flip_flop_tb
   ✓ Test passed
   
   Total Tests: 8
   Passed: 8
   Failed: 0
   
   🎉 All tests passed!

Optional: Documentation Setup
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you want to build the documentation locally:

.. code-block:: bash

   # Install Python dependencies
   pip install -r docs/requirements.txt
   
   # Build documentation
   cd docs
   make html
   
   # View documentation
   open _build/html/index.html  # macOS
   xdg-open _build/html/index.html  # Linux

Quick Start Commands
--------------------

Once installed, here are the most useful commands:

.. code-block:: bash

   # Show all available targets
   make help
   
   # Run all tests
   make test
   
   # Test specific categories
   make test-gates
   make test-combinational
   make test-sequential
   
   # Test individual components
   make test-or-gate
   make test-decoder
   make test-dff
   
   # Build all sources (syntax check)
   make build
   
   # Show project statistics
   make stats
   
   # Clean build artifacts
   make clean

Troubleshooting
---------------

Common Issues
~~~~~~~~~~~~~

**GHDL not found:**

.. code-block:: text

   Error: GHDL is not installed or not in PATH

*Solution:* Ensure GHDL is properly installed and in your system's PATH.

**Permission denied:**

.. code-block:: text

   ./scripts/run_tests.sh: Permission denied

*Solution:* Make the script executable:

.. code-block:: bash

   chmod +x scripts/run_tests.sh

**Test failures:**

.. code-block:: text

   ❌ Some tests failed.

*Solution:* Check the detailed error messages and ensure your GHDL version is compatible.

**Make command not found:**

*Solution:* Install build tools for your platform (see Step 3 above).

Getting Help
~~~~~~~~~~~~

If you encounter issues:

1. Check the :doc:`reference/changelog` for known issues
2. Search existing `GitHub Issues <https://github.com/shishir-dey/vhdl-samples/issues>`_
3. Create a new issue with:
   - Your operating system
   - GHDL version (``ghdl --version``)
   - Complete error message
   - Steps to reproduce

Development Environment
-----------------------

For development work, consider installing:

**Code Editor Extensions:**

- **VS Code**: VHDL Language Support extension
- **Vim**: ``vim-vhdl`` plugin
- **Emacs**: VHDL mode

**Additional Tools:**

.. code-block:: bash

   # Wave viewer for signal analysis
   brew install gtkwave  # macOS
   sudo apt-get install gtkwave  # Ubuntu

**Environment Variables:**

Add to your ``.bashrc`` or ``.zshrc``:

.. code-block:: bash

   export VHDL_SAMPLES_HOME=/path/to/vhdl-samples
   export PATH=$PATH:$VHDL_SAMPLES_HOME/scripts

Next Steps
----------

After successful installation:

1. Explore the :doc:`quickstart` guide
2. Learn about the :doc:`project_structure`
3. Run through the :doc:`components/gates` examples
4. Try :doc:`development/contributing` your own components

Performance Optimization
------------------------

For faster compilation and testing:

**Parallel Testing:**

.. code-block:: bash

   # Use multiple cores for faster builds
   export MAKEFLAGS=-j$(nproc)  # Linux
   export MAKEFLAGS=-j$(sysctl -n hw.ncpu)  # macOS

**GHDL Optimization:**

.. code-block:: bash

   # Add to ~/.bashrc for faster GHDL compilation
   export GHDL_PREFIX=/opt/homebrew  # macOS with Homebrew
   export GHDL_PREFIX=/usr  # Linux

System Integration
------------------

**IDE Integration:**

Most modern IDEs can be configured to use the project's Makefile:

- **Build Command**: ``make build``
- **Test Command**: ``make test``
- **Clean Command**: ``make clean``

**Shell Completion:**

For Bash/Zsh completion of make targets:

.. code-block:: bash

   # Add to your shell config
   complete -W "$(make -pRrq : 2>/dev/null | awk -F: '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}' | sort -u)" make 