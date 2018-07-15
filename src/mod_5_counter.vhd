----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/23/2017 02:13:42 PM
-- Design Name: 
-- Module Name: mod_5_down_counter - rtl
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

entity mod_5_down_counter is
    Port ( Input : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (2 downto 0));
end mod_5_down_counter;

architecture rtl of mod_5_down_counter is
Type myType is (s0,s1,s2,s3,s4);
Signal state: myType:=s4;
begin
process(Input,State,CLK)   --process for transfer function
begin
    if(Input='0') then
        state <= state;
    else
        if(rising_edge(CLK)) then
            case state is
                when s4 => state <= s3;
                when s3 => state <= s2;
                when s2 => state <= s1;
                when s1 => state <= s0;
                when others => state <= s4;
            end case;
        end if;
       end if;
end process;

process(state)   --process for output function
begin
    case state is
        when s0 => Output <= "000";
        when s1 => Output <= "001";
        when s2 => Output <= "010";
        when s3 => Output <= "011";
        when s4 => Output <= "100";
        end case;
end process;
end rtl;
