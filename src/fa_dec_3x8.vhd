----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/21/2017 03:38:20 PM
-- Design Name: 
-- Module Name: fa_dec_3x8 - Structural
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

entity fa_dec_3x8 is
    Port ( Ain : in STD_LOGIC;
           Bin : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Sum : inout STD_LOGIC;
           Carry : inout STD_LOGIC);
end fa_dec_3x8;

architecture Structural of fa_dec_3x8 is
component or_gate is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           O : out STD_LOGIC);
end component;

component decoder_3x8_str is
    Port ( inp : in STD_LOGIC_VECTOR (2 downto 0);
           outp : inout STD_LOGIC_VECTOR (7 downto 0));
end component;
Signal temp_in:std_logic_vector(2 downto 0);
Signal temp_out: std_logic_vector(7 downto 0);
begin
temp_in <= Ain&Bin&Cin;
dec1: decoder_3x8_str port map(temp_in,temp_out);
or1: or_gate port map(temp_out(1),temp_out(2),temp_out(4),temp_out(7),Sum);
or2: or_gate port map(temp_out(3),temp_out(5),temp_out(6),temp_out(6),Carry);

end Structural;
