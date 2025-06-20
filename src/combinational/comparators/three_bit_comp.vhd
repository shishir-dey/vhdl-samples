----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Combinational Logic - Comparators
-- Module Name: three_bit_comp
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: 3-bit magnitude comparator implementation
-- 
-- Dependencies: IEEE.STD_LOGIC_1164
-- 
-- Revision:
-- Revision 1.0 - Complete reorganization and standardization
-- Additional Comments: Part of comprehensive VHDL learning repository
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity three_bit_comp is
    Port ( Ain : in STD_LOGIC_VECTOR(2 downto 0);
           Bin : in STD_LOGIC_VECTOR(2 downto 0);
           Gr : out STD_LOGIC;
           Sm : out STD_LOGIC;
           Eq : out STD_LOGIC);
end three_bit_comp;

architecture Structural of three_bit_comp is
component one_bit_comp is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Gr : out STD_LOGIC;
           Eq : out STD_LOGIC;
           Sm : out STD_LOGIC);
end component;
Signal G0,G1,G2,E0,E1,E2,S0,S1,S2: std_logic;
begin

one_comp1: one_bit_comp port map(Ain(0),Bin(0),G0,E0,S0);
one_comp2: one_bit_comp port map(Ain(1),Bin(1),G1,E1,S1);
one_comp3: one_bit_comp port map(Ain(2),Bin(2),G2,E2,S2);

Eq <= E0 and E1 and E2;
Gr <= G2 or (E2 and G1) or (E2 and e1 and G2);
Sm <= S2 or (E2 and S1) or (E2 and E1 and S2);

end Structural;
