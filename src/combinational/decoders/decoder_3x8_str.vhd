----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Combinational Logic - Decoders
-- Module Name: decoder_3x8_str
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: 3-to-8 line decoder using structural modeling
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

entity decoder_3x8_str is
    Port ( inp : in STD_LOGIC_VECTOR (2 downto 0);
           outp : inout STD_LOGIC_VECTOR (7 downto 0));
end decoder_3x8_str;

architecture Structural of decoder_3x8_str is
Signal t_in:std_logic_vector(1 downto 0);
Signal t_out1:std_logic_vector(3 downto 0);
Signal t_out2:std_logic_vector(3 downto 0);
component decoder_2x4 is
    Port ( input : in STD_LOGIC_VECTOR (1 downto 0);
           en : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0));
end component;

begin
t_in <= inp(1)&inp(0);
t_out1 <= outp(0)&outp(1)&outp(2)&outp(3);
t_out2 <= outp(4)&outp(5)&outp(6)&outp(7);
dec1:decoder_2x4 port map(t_in,inp(2),t_out1);
dec2:decoder_2x4 port map(t_in,inp(2),t_out2);

end Structural;
