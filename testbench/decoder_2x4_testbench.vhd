----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/28/2017 04:24:03 PM
-- Design Name: 
-- Module Name: decoder_2x4_testbench - Behavioral
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder_2x4_testbench is
--  Port ( );
end decoder_2x4_testbench;

architecture Behavioral of decoder_2x4_testbench is
component decoder_2x4 is
    Port ( input : in STD_LOGIC_VECTOR (1 downto 0);
           en : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0));
end component;
Signal inp_vector: std_logic_vector(2 downto 0);
Signal out_vector: std_logic_vector(3 downto 0);
begin
test: process
    begin
    inp_vector<="000";
    wait for 10ns;
    
    inp_vector<="001";
    wait for 10ns;
        
    inp_vector<="010";
    wait for 10ns;
            
    inp_vector<="011";
    wait for 10ns;
                
    inp_vector<="100";
    wait for 10ns;
                    
    inp_vector<="101";
    wait for 10ns;
                        
    inp_vector<="110";
    wait for 10ns;
                            
    inp_vector<="111";
    wait for 10ns;
    
    end process test;
end Behavioral;
