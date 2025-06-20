----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Combinational Logic - Adders
-- Module Name: fa_behaviour
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: Full adder implementation using behavioral modeling
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
