----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/22/2017 03:06:15 PM
-- Design Name: 
-- Module Name: d_flip_flop - Behavioral
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

entity d_flip_flop is
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC);
end d_flip_flop;

architecture Behavioral of d_flip_flop is
--Signal q_temp: std_logic;
begin
process(D,clk)
begin
    if(clk' event and clk='1') then
        Q <= D;
        end if;
end process;
end Behavioral;
