----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/21/2017 02:03:48 PM
-- Design Name: 
-- Module Name: fa_mux_4x1 - Structural
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

entity fa_mux_4x1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Carry : out STD_LOGIC);
end fa_mux_4x1;

architecture Structural of fa_mux_4x1 is

component mux_4x1_str is
    Port ( d : in STD_LOGIC_VECTOR (3 downto 0);
           s : in STD_LOGIC_VECTOR (1 downto 0);
           o : out STD_LOGIC);
end component;
Signal C_INV : std_logic;
Signal temp1: std_logic_vector(3 downto 0);
Signal temp2: std_logic_vector(3 downto 0);
Signal temp3: std_logic_vector(1 downto 0);
begin
temp1 <=C&C_INV&C_INV&C;
temp2 <='0'&C_INV&C_INV&'1';
temp3<=A&B;
C_INV <= not C;
m1: mux_4x1_str port map(temp1,temp3,Sum);
m2: mux_4x1_str port map(temp2,temp3,Carry);

end Structural;
