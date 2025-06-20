----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Combinational Logic - Decoders
-- Module Name: decoder_2x4
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: 2-to-4 line decoder with enable signal
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

entity decoder_2x4 is
    Port ( input : in STD_LOGIC_VECTOR (1 downto 0);
           en : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0));
end decoder_2x4;

architecture Behavioral of decoder_2x4 is
begin
process(input,en)
begin
if(en='1') then
    case input is
     when "00" => output <="0001";
     when "01" => output <="0010";
     when "10" => output <="0100";
      when others => output<="1000";
    end case;
else
    output<="0000";
end if;
end process;
end Behavioral;
