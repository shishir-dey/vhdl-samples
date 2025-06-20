API Reference
=============

Component interface documentation and API reference.

.. note::

   This section provides interface documentation for all VHDL components.

Component Interfaces
--------------------

Basic Gates
~~~~~~~~~~~

**OR Gate (4-input)**

.. code-block:: vhdl

   entity or_gate is
       Port ( A : in STD_LOGIC;
              B : in STD_LOGIC;
              C : in STD_LOGIC;
              D : in STD_LOGIC;
              O : out STD_LOGIC);
   end or_gate;

**XOR Gate (3-input)**

.. code-block:: vhdl

   entity xor_3 is
       Port ( A : in STD_LOGIC;
              B : in STD_LOGIC;
              C : in STD_LOGIC;
              O : out STD_LOGIC);
   end xor_3;

Combinational Logic
~~~~~~~~~~~~~~~~~~~

**2x4 Decoder**

.. code-block:: vhdl

   entity decoder_2x4 is
       Port ( A : in STD_LOGIC_VECTOR(1 downto 0);
              O : out STD_LOGIC_VECTOR(3 downto 0));
   end decoder_2x4;

**2x1 Multiplexer**

.. code-block:: vhdl

   entity mux_2x1_df is
       Port ( A : in STD_LOGIC;
              B : in STD_LOGIC;
              S : in STD_LOGIC;
              O : out STD_LOGIC);
   end mux_2x1_df;

Sequential Logic
~~~~~~~~~~~~~~~~

**D Flip-Flop**

.. code-block:: vhdl

   entity d_flip_flop is
       Port ( D : in STD_LOGIC;
              CLK : in STD_LOGIC;
              Q : out STD_LOGIC;
              Qn : out STD_LOGIC);
   end d_flip_flop;

**8-bit Register**

.. code-block:: vhdl

   entity register_8_bit is
       Port ( CLK : in STD_LOGIC;
              RST : in STD_LOGIC;
              EN : in STD_LOGIC;
              D : in STD_LOGIC_VECTOR(7 downto 0);
              Q : out STD_LOGIC_VECTOR(7 downto 0));
   end register_8_bit;

Usage Examples
--------------

**Basic instantiation:**

.. code-block:: vhdl

   signal a, b, c, d, output : std_logic;
   
   gate_inst: or_gate port map (
       A => a,
       B => b,
       C => c,
       D => d,
       O => output
   );

**With generics:**

.. code-block:: vhdl

   generic map (
       WIDTH => 8
   )
   port map (
       CLK => clock,
       D => data_in,
       Q => data_out
   );

For detailed component documentation, see:

- :doc:`../components/gates`
- :doc:`../components/combinational`
- :doc:`../components/sequential` 