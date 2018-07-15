----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/21/2017 02:38:17 PM
-- Design Name: 
-- Module Name: decoder_2x4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
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
