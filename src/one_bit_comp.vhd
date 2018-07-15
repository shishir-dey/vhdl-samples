----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/21/2017 04:27:50 PM
-- Design Name: 
-- Module Name: one_bit_comp - Dataflow
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

entity one_bit_comp is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Gr : out STD_LOGIC;
           Eq : out STD_LOGIC;
           Sm : out STD_LOGIC);
end one_bit_comp;

architecture Dataflow of one_bit_comp is

begin

Gr <= A and (not B);
Eq <= A xnor B;
Sm <= (not A) and B;

end Dataflow;
