----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/22/2017 04:00:08 PM
-- Design Name: 
-- Module Name: pipo_register_dff - Behavioral
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

entity pipo_register_dff is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           xl : in STD_LOGIC;
           xr : in STD_LOGIC;
           clk : in STD_LOGIC;
           c : in STD_LOGIC_VECTOR (1 downto 0);
           z : out STD_LOGIC_VECTOR (3 downto 0));
end pipo_register_dff;

architecture Behavioral of pipo_register_dff is
component d_flip_flop is
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;
component mux_4x1_str is
    Port ( d : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           o : out STD_LOGIC);
end component;

Signal mi0,mi1,mi2,mi3:std_logic_vector(3 downto 0);
Signal m0,m1,m2,m3: std_logic;
Signal z_t: std_logic_vector(3 downto 0);
begin
 
mi0 <= x(3)&xr&z_t(3)&z_t(2);
mi1 <= x(2)&z_t(3)&z_t(1)&z_t(2);
mi2 <= x(1)&z_t(2)&z_t(0)&z_t(1);
mi3 <= x(0)&z_t(1)&x(1)&z_t(0);

mux1: mux_4x1_str port map(mi0,c,m0);
mux2: mux_4x1_str port map(mi1,c,m1);
mux3: mux_4x1_str port map(mi2,c,m2);
mux4: mux_4x1_str port map(mi3,c,m3);

dff1: d_flip_flop port map(m0,clk,z(0));
dff2: d_flip_flop port map(m1,clk,z(1));
dff3: d_flip_flop port map(m2,clk,z(2));
dff4: d_flip_flop port map(m3,clk,z(3));
z <= z_t;
end Behavioral;
