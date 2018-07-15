----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/22/2017 03:15:38 PM
-- Design Name: 
-- Module Name: t_flip_flop - Behavioral
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

entity t_flip_flop is
    Port ( T : in STD_LOGIC;
           en : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : inout STD_LOGIC);
end t_flip_flop;

architecture Behavioral of t_flip_flop is

begin
process(T,en,clk)
begin
    if(en='1') then
        if(rising_edge(clk)) then
            Q <= not T;
            end if;
    else
        Q <= Q;
    end if;
end process;
end Behavioral;
