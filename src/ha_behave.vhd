----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/19/2017 03:46:33 PM
-- Design Name: 
-- Module Name: ha_behave - Behavioral
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

entity ha_behave is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry : out STD_LOGIC);
end ha_behave;

architecture Behavioral of ha_behave is

begin
process(a,b)
    begin
    if(a = '0' and b = '0') then
        sum <= '0';
        carry <= '0';
     elsif(a = '0' and b = '1') then
          sum <= '1';
          carry <= '0';
     elsif(a = '1' and b = '0') then
           sum <= '1';
           carry <= '0';
     else   sum <= '0';
            carry <= '1';
     end if;
    end process;

end Behavioral;
