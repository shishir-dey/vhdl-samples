----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/22/2017 02:25:01 PM
-- Design Name: 
-- Module Name: barrel_shifter - Structural
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

entity barrel_shifter is
    Port ( X : in STD_LOGIC_VECTOR (7 downto 0);
           Selec : in STD_LOGIC;
           Z : out STD_LOGIC_VECTOR (7 downto 0));
end barrel_shifter;

architecture Structural of barrel_shifter is

component mux_2x1_df is
    Port ( d0 : in STD_LOGIC;
           d1 : in STD_LOGIC;
           sel : in STD_LOGIC;
           output : out STD_LOGIC);
end component;

Signal out1 : std_logic;
Signal out2 : std_logic;
Signal out3 : std_logic;
Signal out4 : std_logic;
Signal out5 : std_logic;
Signal out6 : std_logic;
Signal out7 : std_logic;
Signal out8 : std_logic;

begin

Stage_1_1: mux_2x1_df port map(X(7),X(0),Selec,out1);
Stage_1_2: mux_2x1_df port map(X(0),X(1),Selec,out2);
Stage_1_3: mux_2x1_df port map(X(1),X(2),Selec,out3);
Stage_1_4: mux_2x1_df port map(X(2),X(3),Selec,out4);
Stage_1_5: mux_2x1_df port map(X(3),X(4),Selec,out5);
Stage_1_6: mux_2x1_df port map(X(4),X(5),Selec,out6);
Stage_1_7: mux_2x1_df port map(X(5),X(6),Selec,out7);
Stage_1_8: mux_2x1_df port map(X(6),X(7),Selec,out8);

Stage_2_1: mux_2x1_df port map(out7,out1,Selec,Z(0));
Stage_2_2: mux_2x1_df port map(out8,out2,Selec,Z(1));
Stage_2_3: mux_2x1_df port map(out1,out3,Selec,Z(2));
Stage_2_4: mux_2x1_df port map(out2,out4,Selec,Z(3));
Stage_2_5: mux_2x1_df port map(out3,out5,Selec,Z(4));
Stage_2_6: mux_2x1_df port map(out4,out6,Selec,Z(5));
Stage_2_7: mux_2x1_df port map(out5,out7,Selec,Z(6));
Stage_2_8: mux_2x1_df port map(out6,out8,Selec,Z(7));

end Structural;
