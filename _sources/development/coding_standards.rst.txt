Coding Standards
================

VHDL coding standards and best practices for the project.

.. note::

   Following these standards ensures consistency and maintainability across all project files.

VHDL Style Guide
----------------

Naming Conventions
~~~~~~~~~~~~~~~~~~

**Entities and Components:**

.. code-block:: vhdl

   entity or_gate is  -- lowercase with underscores
       port (...);
   end entity or_gate;

**Architectures:**

.. code-block:: vhdl

   architecture Behavioral of or_gate is  -- PascalCase
   begin
       ...
   end architecture Behavioral;

**Signals and Variables:**

.. code-block:: vhdl

   signal clock_signal : std_logic;     -- lowercase with underscores
   variable temp_value : integer;       -- lowercase with underscores

**Constants:**

.. code-block:: vhdl

   constant MAX_COUNT : integer := 100;  -- UPPERCASE with underscores

Code Formatting
~~~~~~~~~~~~~~~

**Indentation**: Use 2 spaces (no tabs)

.. code-block:: vhdl

   entity example is
     port (
       clk : in std_logic;
       rst : in std_logic;
       data_out : out std_logic_vector(7 downto 0)
     );
   end entity example;

**Line Length**: Maximum 80 characters

**Spacing**: Space around operators

.. code-block:: vhdl

   -- Good
   result <= a + b;
   signal_out <= '1' when enable = '1' else '0';
   
   -- Avoid
   result<=a+b;
   signal_out<='1'when enable='1'else'0';

File Organization
-----------------

Header Comments
~~~~~~~~~~~~~~~

Every VHDL file should start with a standard header:

.. code-block:: vhdl

   -------------------------------------------------------------------------------
   -- Title      : Component Name
   -- Project    : VHDL Digital Design Samples
   -------------------------------------------------------------------------------
   -- File       : component_name.vhd
   -- Author     : Author Name
   -- Created    : 2025-01-XX
   -- Last update: 2025-01-XX
   -- Platform   : 
   -- Standard   : VHDL'08
   -------------------------------------------------------------------------------
   -- Description: Brief description of the component functionality
   -------------------------------------------------------------------------------

Library Declarations
~~~~~~~~~~~~~~~~~~~~

Use standard libraries and be explicit:

.. code-block:: vhdl

   library ieee;
   use ieee.std_logic_1164.all;
   use ieee.numeric_std.all;  -- Preferred over std_logic_arith

Entity Declaration
~~~~~~~~~~~~~~~~~~

.. code-block:: vhdl

   entity component_name is
     generic (
       WIDTH : integer := 8;
       DEPTH : integer := 16
     );
     port (
       clk     : in  std_logic;
       rst     : in  std_logic;
       enable  : in  std_logic;
       data_in : in  std_logic_vector(WIDTH-1 downto 0);
       data_out: out std_logic_vector(WIDTH-1 downto 0)
     );
   end entity component_name;

Architecture Best Practices
----------------------------

Signal Declarations
~~~~~~~~~~~~~~~~~~~

.. code-block:: vhdl

   architecture Behavioral of component_name is
     signal internal_reg : std_logic_vector(WIDTH-1 downto 0);
     signal counter      : unsigned(3 downto 0);
     signal state        : state_type;
   begin

Process Style
~~~~~~~~~~~~~

**Clocked Process:**

.. code-block:: vhdl

   clk_proc: process(clk, rst)
   begin
     if rst = '1' then
       -- Reset logic
       internal_reg <= (others => '0');
     elsif rising_edge(clk) then
       -- Clock logic
       if enable = '1' then
         internal_reg <= data_in;
       end if;
     end if;
   end process clk_proc;

**Combinational Process:**

.. code-block:: vhdl

   comb_proc: process(all)  -- VHDL'08 style
   begin
     case state is
       when IDLE =>
         next_state <= ACTIVE;
       when ACTIVE =>
         next_state <= IDLE;
       when others =>
         next_state <= IDLE;
     end case;
   end process comb_proc;

Documentation Standards
-----------------------

Comments
~~~~~~~~

- Comment complex logic and algorithms
- Explain the purpose, not just the implementation
- Use consistent comment style

.. code-block:: vhdl

   -- Calculate the next Fibonacci number
   -- Uses the recurrence relation: F(n) = F(n-1) + F(n-2)
   next_fib <= prev_fib + curr_fib;

Component Documentation
~~~~~~~~~~~~~~~~~~~~~~~

Each component should have:

1. **Purpose**: What the component does
2. **Interface**: Description of ports and generics
3. **Behavior**: How it operates
4. **Usage**: Example instantiation

Testing Standards
-----------------

Testbench Structure
~~~~~~~~~~~~~~~~~~~

.. code-block:: vhdl

   entity component_tb is
   end entity component_tb;
   
   architecture Behavioral of component_tb is
     -- Component declaration
     component component_name is
       port (...);
     end component;
     
     -- Test signals
     signal clk_tb : std_logic := '0';
     signal rst_tb : std_logic := '1';
     
     -- Clock period
     constant CLK_PERIOD : time := 10 ns;
   begin
     -- Clock generation
     clk_tb <= not clk_tb after CLK_PERIOD/2;
     
     -- Component instantiation
     uut: component_name
       port map (...);
     
     -- Test process
     test_proc: process
     begin
       -- Test cases
       wait for CLK_PERIOD*2;
       rst_tb <= '0';
       
       -- Assertions for verification
       assert condition report "Error message" severity error;
       
       wait;
     end process test_proc;
   end architecture Behavioral;

Quality Guidelines
------------------

Synthesis Considerations
~~~~~~~~~~~~~~~~~~~~~~~~

- Avoid using ``after`` statements in synthesizable code
- Use ``rising_edge()`` instead of ``'event`` for clock detection
- Minimize the use of ``wait`` statements
- Be explicit about reset behavior

Performance Guidelines
~~~~~~~~~~~~~~~~~~~~~~

- Minimize logic depth in combinational paths
- Use appropriate data types (prefer ``unsigned`` over ``std_logic_vector`` for arithmetic)
- Consider pipeline stages for high-speed designs

Common Mistakes to Avoid
------------------------

**Don't:**

.. code-block:: vhdl

   -- Avoid multiple drivers
   signal_a <= value1;
   signal_a <= value2;  -- Error!
   
   -- Avoid incomplete sensitivity lists
   process(clk)  -- Missing rst
   begin
     if rst = '1' then
       ...
     elsif rising_edge(clk) then
       ...
     end if;
   end process;

**Do:**

.. code-block:: vhdl

   -- Use proper sensitivity lists
   process(clk, rst)
   begin
     if rst = '1' then
       ...
     elsif rising_edge(clk) then
       ...
     end if;
   end process;

Compliance Checking
-------------------

Use these commands to verify compliance:

.. code-block:: bash

   # Syntax check
   make build
   
   # Run tests
   make test
   
   # Style check (if available)
   # Custom linting tools can be added here 