----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/28/2017 03:13:12 PM
-- Design Name: 
-- Module Name: xor_testbench - Behavioral
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

entity xor_testbench is
--  Port ( );
end xor_testbench;

architecture Behavioral of xor_testbench is
component xor_3 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           O : out STD_LOGIC);
end component;
Signal inp_vector : std_logic_vector(2 downto 0);
Signal result : std_logic;
begin
uut: xor_3 port map(A=>inp_vector(2),B=>inp_vector(1),C=>inp_vector(0),O=>result);
test1: process
begin
    inp_vector<="000";
    wait for 100ns;
    
    inp_vector<="001";
    wait for 100ns;
    
    inp_vector<="010";
    wait for 100ns;
        
    inp_vector<="011";
    wait for 100ns;
            
     inp_vector<="100";
     wait for 100ns;
                
     inp_vector<="101";
     wait for 100ns;
                    
     inp_vector<="110";
     wait for 100ns;
                        
     inp_vector<="111";
     wait for 100ns;
    
end process test1;
end Behavioral;
