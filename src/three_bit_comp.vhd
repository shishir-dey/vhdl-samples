----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/21/2017 04:42:57 PM
-- Design Name: 
-- Module Name: three_bit_comp - Structural
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

entity three_bit_comp is
    Port ( Ain : in STD_LOGIC_VECTOR(2 downto 0);
           Bin : in STD_LOGIC_VECTOR(2 downto 0);
           Gr : out STD_LOGIC;
           Sm : out STD_LOGIC;
           Eq : out STD_LOGIC);
end three_bit_comp;

architecture Structural of three_bit_comp is
component one_bit_comp is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Gr : out STD_LOGIC;
           Eq : out STD_LOGIC;
           Sm : out STD_LOGIC);
end component;
Signal G0,G1,G2,E0,E1,E2,S0,S1,S2: std_logic;
begin

one_comp1: one_bit_comp port map(Ain(0),Bin(0),G0,E0,S0);
one_comp2: one_bit_comp port map(Ain(1),Bin(1),G1,E1,S1);
one_comp3: one_bit_comp port map(Ain(2),Bin(2),G2,E2,S2);

Eq <= E0 and E1 and E2;
Gr <= G2 or (E2 and G1) or (E2 and e1 and G2);
Sm <= S2 or (E2 and S1) or (E2 and E1 and S2);

end Structural;
