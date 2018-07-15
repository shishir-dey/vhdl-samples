----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/20/2017 02:58:52 PM
-- Design Name: 
-- Module Name: adder_subtractor_4bit - Structural
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

entity adder_subtractor_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           P : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end adder_subtractor_4bit;

architecture Structural of adder_subtractor_4bit is

component fa_dataflow is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry : out STD_LOGIC);
end component;

Signal c1,c2,c3:std_logic;
Signal temp: std_logic_vector(3 downto 0);

begin
temp(0) <= B(0) xor M;
temp(1) <= B(1) xor M;
temp(2) <= B(2) xor M;
temp(3) <= B(3) xor M;
fa1: fa_dataflow port map(A(0),temp(0),M,P(0),c1);
fa2: fa_dataflow port map(A(1),temp(1),c1,P(1),c2);
fa3: fa_dataflow port map(A(2),temp(2),c2,P(2),c3);
fa4: fa_dataflow port map(A(3),temp(3),c3,P(3),cout);

end Structural;
