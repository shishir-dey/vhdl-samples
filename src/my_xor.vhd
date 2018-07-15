----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/20/2017 04:02:13 PM
-- Design Name: 
-- Module Name: my_xor - Structural
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

entity my_xor is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           o : out STD_LOGIC);
end my_xor;

architecture Structural of my_xor is

component mux_2x1_df is
    Port ( d0 : in STD_LOGIC;
           d1 : in STD_LOGIC;
           sel : in STD_LOGIC;
           output : out STD_LOGIC);
end component;
Signal temp: std_logic;
begin
temp<=not b;
m1: mux_2x1_df port map(b,temp,a,o);

end Structural;
