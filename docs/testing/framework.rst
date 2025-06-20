Testing Framework
=================

Documentation for the VHDL testing infrastructure and methodologies.

.. note::

   This section provides details about the project's testing approach and tools.

Overview
--------

The VHDL Digital Design Samples project uses a comprehensive testing framework built around:

- **GHDL**: Open-source VHDL simulator
- **Assertion-based testing**: Built-in VHDL assertions for verification
- **Automated test runner**: Shell script for batch testing
- **Make integration**: Convenient build system targets

Test Structure
--------------

All tests follow a consistent pattern and are organized to mirror the source structure.

Test Organization
~~~~~~~~~~~~~~~~~

.. code-block:: text

   test/
   ├── gates/              # Basic gate tests
   ├── combinational/      # Combinational logic tests
   └── sequential/         # Sequential logic tests

Test Naming Convention
~~~~~~~~~~~~~~~~~~~~~~

- **Source file**: ``component_name.vhd``
- **Test file**: ``component_name_tb.vhd`` or ``component_name_testbench.vhd``
- **Test entity**: Matches testbench filename

Running Tests
-------------

**Run all tests:**

.. code-block:: bash

   make test

**Run by category:**

.. code-block:: bash

   make test-gates
   make test-combinational
   make test-sequential

**Run individual tests:**

.. code-block:: bash

   make test-or-gate
   make test-decoder
   make test-dff

Test Methodology
----------------

Each testbench follows these principles:

1. **Complete coverage**: Test all input combinations where feasible
2. **Assertion-based verification**: Use VHDL assertions for automatic checking
3. **Clear timing**: Proper setup and hold times
4. **Self-checking**: Tests pass or fail without manual inspection

For more details, see :doc:`coverage` and :doc:`ci_cd`. 