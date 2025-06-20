Build System
============

Overview of the Make-based build system for VHDL development.

Overview
--------

The project uses a comprehensive Makefile to automate:

- **Compilation**: GHDL-based VHDL compilation
- **Testing**: Automated test execution
- **Documentation**: Sphinx documentation building
- **Project management**: Statistics and cleanup

Make Targets
------------

Core Targets
~~~~~~~~~~~~

.. code-block:: bash

   make help          # Show all available targets
   make test          # Run complete test suite
   make build         # Compile all VHDL sources
   make clean         # Remove build artifacts

Testing Targets
~~~~~~~~~~~~~~~

.. code-block:: bash

   make test-gates           # Test basic gates only
   make test-combinational   # Test combinational logic
   make test-sequential      # Test sequential logic
   make test-or-gate        # Test specific component
   make test-decoder        # Test specific component
   make test-dff            # Test specific component

Documentation Targets
~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

   make docs          # Build documentation
   make docs-serve    # Serve documentation locally
   make docs-dev      # Development mode (build + serve)
   make docs-clean    # Clean documentation build
   make docs-check    # Check for broken links
   make docs-install  # Install Python dependencies

Utility Targets
~~~~~~~~~~~~~~~

.. code-block:: bash

   make stats              # Show project statistics
   make list-components    # List all VHDL components
   make install           # Install GHDL (macOS only)
   make check-ghdl        # Verify GHDL installation

Build Configuration
-------------------

**GHDL Settings:**

- **Standard**: VHDL'08
- **Work Directory**: ``work/``
- **Flags**: ``--std=08``

**File Organization:**

The build system automatically discovers:

- Source files in ``src/`` hierarchy
- Test files in ``test/`` hierarchy
- Builds in isolated ``work/`` directory

**Parallel Execution:**

.. code-block:: bash

   # Use multiple CPU cores
   export MAKEFLAGS=-j$(nproc)  # Linux
   export MAKEFLAGS=-j$(sysctl -n hw.ncpu)  # macOS

Customization
-------------

**Environment Variables:**

.. code-block:: bash

   export GHDL=ghdl-custom     # Use custom GHDL binary
   export GHDL_FLAGS="--std=93" # Use VHDL'93 standard

**Adding New Targets:**

To add a new component test:

.. code-block:: makefile

   test-my-component: check-ghdl $(WORK_DIR)
   	@cd $(WORK_DIR) && \
   	$(GHDL) -a ../src/path/my_component.vhd && \
   	$(GHDL) -a ../test/path/my_component_tb.vhd && \
   	$(GHDL) -e my_component_tb && \
   	$(GHDL) -r my_component_tb --stop-time=1ms && \
   	echo "$(GREEN)✓ My Component test passed$(NC)"

Dependencies
------------

**Required Tools:**

- **GHDL**: VHDL compiler and simulator
- **Make**: Build automation (GNU Make 3.81+)
- **Git**: Version control

**Optional Tools:**

- **Python 3.7+**: For documentation
- **GTKWave**: Waveform viewer for debugging 