----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/19/2017 04:32:10 PM
-- Design Name: 
-- Module Name: fa_behaviour - Behavioral
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

entity fa_behaviour is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry : out STD_LOGIC);
end fa_behaviour;

architecture Behavioral of fa_behaviour is

begin
process(a,b,c)
begin
    if(a = '0' and b = '0' and c = '0') then
    sum <= '0';
    carry <= '0';
    
    elsif(a = '0' and b = '0' and c = '1') then
    sum <= '1';
    carry <= '0';
    
    elsif(a = '0' and b = '1' and c = '0') then
        sum <= '1';
        carry <= '0';
        
    elsif(a = '0' and b = '1' and c = '1') then
        sum <= '0';
        carry <= '1';
        
     elsif(a = '1' and b = '0' and c = '0') then
         sum <= '1';
         carry <= '0';
         
     elsif(a = '1' and b = '0' and c = '1') then
             sum <= '0';
             carry <= '1';
             
      elsif(a = '1' and b = '1' and c = '0') then
            sum <= '0';
            carry <= '1';
                 
      else
           sum <= '1';
           carry <= '1';
           
       end if;
     end process;

end Behavioral;
