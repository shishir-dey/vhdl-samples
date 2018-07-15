----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/22/2017 03:56:44 PM
-- Design Name: 
-- Module Name: register_8_bit - Behavioral
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

entity register_8_bit is
    Port ( Data : in STD_LOGIC_VECTOR (7 downto 0);
           LOAD : in STD_LOGIC;
           HALT : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC);
end register_8_bit;

architecture Behavioral of register_8_bit is

begin
process(Data,LOAD,HALT,clk)
begin
    if(LOAD='1') then
    if(clk' event and clk='1') then
        Output <= Data;
        end if;
        end if;
end process;

end Behavioral;
