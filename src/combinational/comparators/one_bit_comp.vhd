----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Combinational Logic - Comparators
-- Module Name: one_bit_comp
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: 1-bit magnitude comparator implementation
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

entity one_bit_comp is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Gr : out STD_LOGIC;
           Eq : out STD_LOGIC;
           Sm : out STD_LOGIC);
end one_bit_comp;

architecture Dataflow of one_bit_comp is

begin

Gr <= A and (not B);
Eq <= A xnor B;
Sm <= (not A) and B;

end Dataflow;
