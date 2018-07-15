----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/20/2017 04:26:58 PM
-- Design Name: 
-- Module Name: mux_4x1_str - Structural
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

entity mux_4x1_str is
    Port ( d : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           o : out STD_LOGIC);
end mux_4x1_str;

architecture Structural of mux_4x1_str is

component mux_2x1_df is
    Port ( d0 : in STD_LOGIC;
           d1 : in STD_LOGIC;
           sel : in STD_LOGIC;
           output : out STD_LOGIC);
end component;
Signal o1,o2: std_logic;
begin

m1: mux_2x1_df port map(d(0),d(1),s(1),o1);
m2: mux_2x1_df port map(d(2),d(3),s(1),o2);
m3: mux_2x1_df port map(o1,o2,s(0),o);


end Structural;
