----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Combinational Logic - Multiplexers
-- Module Name: mux_8x1_str
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: 8-to-1 multiplexer using structural modeling
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

entity mux_8x1_str is
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           sel1 : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC);
end mux_8x1_str;

architecture Structural of mux_8x1_str is
component mux_4x1_str is
    Port ( d : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           o : out STD_LOGIC);
end component;
component mux_2x1_df is
    Port ( d0 : in STD_LOGIC;
           d1 : in STD_LOGIC;
           sel : in STD_LOGIC;
           output : out STD_LOGIC);
end component;
Signal o1,o2: std_logic;
Signal temp1: std_logic_vector(3 downto 0);
Signal temp2: std_logic_vector(3 downto 0);
Signal sele: std_logic_vector(1 downto 0);
begin
temp1 <= D(0)&D(1)&D(2)&D(3);
temp2 <= D(4)&D(5)&D(6)&D(7);
sele <=sel1(2)&sel1(1);
m1: mux_4x1_str port map(temp1,sele,o1);
m2: mux_4x1_str port map(temp2,sele,o2);
m3: mux_2x1_df port map(o1,o2,sel1(0),O);

end Structural;
