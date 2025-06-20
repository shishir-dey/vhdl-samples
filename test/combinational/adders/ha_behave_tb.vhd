----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Combinational Logic - Adders
-- Module Name: ha_behave_tb
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: Testbench for Half adder implementation using behavioral modeling
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

entity ha_behave_tb is
--  Port ( );
end ha_behave_tb;

architecture Behavioral of ha_behave_tb is
component ha_behave is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry : out STD_LOGIC);
end component;
Signal testv_inp,testv_out:std_logic_vector(1 downto 0);
begin
uut: ha_behave port map(a=>testv_inp(1),b=>testv_inp(0),sum=>testv_out(1),carry=>testv_out(0));
testing: process
begin
    testv_inp<="00";
    wait for 100 ns;
    
    testv_inp<="01";
    wait for 100 ns;
    
    testv_inp<="10";
    wait for 100 ns;
    
    testv_inp<="11";
    wait for 100 ns;
    end process testing;
end Behavioral;
