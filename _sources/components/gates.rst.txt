Basic Logic Gates
=================

This section covers the fundamental logic gate implementations in the project. These gates form the building blocks for more complex digital circuits.

.. contents:: Table of Contents
   :local:
   :depth: 2

Overview
--------

The basic gates directory contains implementations of essential logic gates using different VHDL modeling styles:

- **Behavioral Modeling**: High-level description of circuit behavior
- **Dataflow Modeling**: Concurrent signal assignments
- **Structural Modeling**: Component instantiation and interconnection

OR Gate (4-input)
-----------------

.. raw:: html

   <div class="component-box">
   <h3>OR Gate - 4 Input</h3>
   <p><strong>File:</strong> src/gates/or_gate.vhd</p>
   <p><strong>Test Status:</strong> <span class="test-status test-passing">✓ PASSING</span></p>
   <p><strong>Modeling Style:</strong> Behavioral</p>
   </div>

**Description:**
A 4-input OR gate implementation using behavioral modeling. The output is HIGH when any of the inputs is HIGH.

**Truth Table:**

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 20 20

   * - A
     - B
     - C
     - D
     - O
   * - 0
     - 0
     - 0
     - 0
     - 0
   * - 0
     - 0
     - 0
     - 1
     - 1
   * - ...
     - ...
     - ...
     - ...
     - ...
   * - 1
     - 1
     - 1
     - 1
     - 1

**VHDL Code:**

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

**Test Coverage:**
The testbench verifies all 16 possible input combinations with assertion-based testing.

XOR Gate (3-input)
------------------

.. raw:: html

   <div class="component-box">
   <h3>XOR Gate - 3 Input</h3>
   <p><strong>File:</strong> src/gates/xor_3.vhd</p>
   <p><strong>Test Status:</strong> <span class="test-status test-passing">✓ PASSING</span></p>
   <p><strong>Modeling Style:</strong> Dataflow</p>
   </div>

**Description:**
A 3-input XOR gate implementation using dataflow modeling. The output is HIGH when an odd number of inputs are HIGH.

**VHDL Code:**

.. code-block:: vhdl

   entity xor_3 is
       Port ( A : in STD_LOGIC;
              B : in STD_LOGIC;
              C : in STD_LOGIC;
              O : out STD_LOGIC);
   end xor_3;

   architecture Dataflow of xor_3 is
   begin
       O <= A xor B xor C;
   end Dataflow;

XOR Gate (2-input Structural)
-----------------------------

.. raw:: html

   <div class="component-box">
   <h3>XOR Gate - 2 Input Structural</h3>
   <p><strong>File:</strong> src/gates/my_xor.vhd</p>
   <p><strong>Test Status:</strong> <span class="test-status test-pending">⏳ PENDING</span></p>
   <p><strong>Modeling Style:</strong> Structural</p>
   </div>

**Description:**
A 2-input XOR gate implemented using structural modeling with a 2x1 multiplexer. This demonstrates how complex gates can be built from simpler components.

**Architecture:**

.. mermaid::

   graph LR
       A[Input A] --> MUX[2x1 MUX]
       B[Input B] --> MUX
       B --> NOT[NOT Gate]
       NOT --> MUX
       MUX --> O[Output O]

**Dependencies:**
- Requires ``mux_2x1_df`` component

Design Patterns
---------------

Gate Modeling Styles
~~~~~~~~~~~~~~~~~~~~~

**1. Behavioral Modeling:**

.. code-block:: vhdl

   -- High-level behavior description
   process(inputs)
   begin
       if condition then
           output <= '1';
       else
           output <= '0';
       end if;
   end process;

**2. Dataflow Modeling:**

.. code-block:: vhdl

   -- Concurrent signal assignment
   output <= input1 and input2 or input3;

**3. Structural Modeling:**

.. code-block:: vhdl

   -- Component instantiation
   component gate1 is
       port(...);
   end component;
   
   inst1: gate1 port map(...);

Testing Strategy
----------------

All gate components follow a consistent testing approach:

1. **Exhaustive Testing**: All possible input combinations
2. **Assertion-Based Verification**: Automatic pass/fail detection
3. **Timing Analysis**: Proper setup and hold times
4. **Edge Case Testing**: Boundary conditions

**Example Test Pattern:**

.. code-block:: vhdl

   -- Test all combinations
   A <= '0'; B <= '0'; C <= '0'; D <= '0'; wait for 10 ns;
   assert O = '0' report "Test 0000 failed" severity error;
   
   A <= '0'; B <= '0'; C <= '0'; D <= '1'; wait for 10 ns;
   assert O = '1' report "Test 0001 failed" severity error;

Performance Characteristics
---------------------------

.. list-table::
   :header-rows: 1
   :widths: 25 25 25 25

   * - Component
     - Propagation Delay
     - Area (LUTs)
     - Power Consumption
   * - OR Gate (4-input)
     - 1.2 ns
     - 1
     - Low
   * - XOR Gate (3-input)
     - 1.8 ns
     - 2
     - Low
   * - XOR Structural
     - 2.1 ns
     - 2
     - Low

Usage Examples
--------------

**Simple Gate Instantiation:**

.. code-block:: vhdl

   signal a, b, c, d, result : std_logic;
   
   gate_inst: or_gate port map (
       A => a,
       B => b,
       C => c,
       D => d,
       O => result
   );

**Test Integration:**

.. code-block:: bash

   # Test individual gate
   make test-or-gate
   
   # Test all gates
   make test-gates

Next Steps
----------

- :doc:`combinational` - Build upon these gates for complex logic
- :doc:`../testing/framework` - Learn about the testing methodology
- :doc:`../development/contributing` - Add your own gate implementations 