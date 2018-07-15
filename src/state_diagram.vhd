----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/23/2017 03:38:40 PM
-- Design Name: 
-- Module Name: state_diagram - rtl
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

entity state_diagram is
    Port ( Input : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Output : out STD_LOGIC);
end state_diagram;

architecture rtl of state_diagram is
Type newType is (s0,s1,s2);
Signal state: newType:=s0;
begin
process(Input,State,CLK)   --process for transfer function
begin
    if(Input='0' and rising_edge(clk)) then
        state <= s1;
        output <= '0'; -- 0 = p
    elsif(Input='1' and rising_edge(clk)) then
        case state is
            when s0 => state <= s2;
                        Output <= '1';  -- 1 = q
            when s1 => state <= s0;
                        Output <= '0';   -- 0 = p
            when s2 => state <= s2;
                        Output <= '0';   -- 0 = p
        end case;
    end if;
end process;
end rtl;