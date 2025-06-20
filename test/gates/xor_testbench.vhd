----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Basic Logic Gates
-- Module Name: xor_testbench
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: Testbench for xor component
-- 
-- Dependencies: IEEE.STD_LOGIC_1164
-- 
-- Revision:
-- Revision 1.0 - Complete reorganization and standardization
-- Additional Comments: Part of comprehensive VHDL learning repository
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
    wait for 100 ns;
    
    inp_vector<="001";
    wait for 100 ns;
    
    inp_vector<="010";
    wait for 100 ns;
        
    inp_vector<="011";
    wait for 100 ns;
            
     inp_vector<="100";
     wait for 100 ns;
                
     inp_vector<="101";
     wait for 100 ns;
                    
     inp_vector<="110";
     wait for 100 ns;
                        
     inp_vector<="111";
     wait for 100 ns;
    
end process test1;
end Behavioral;
