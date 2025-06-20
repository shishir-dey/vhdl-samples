----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Combinational Logic - Adders
-- Module Name: rc_adder_testbench
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: Testbench for rc_adder component
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

entity rc_adder_testbench is
--  Port ( );
end rc_adder_testbench;

architecture Behavioral of rc_adder_testbench is
component rc_adder_4bit is
    Port ( rc_a : in STD_LOGIC_VECTOR (3 downto 0);
           rc_b : in STD_LOGIC_VECTOR (3 downto 0);
           rc_cin : in STD_LOGIC;
           rc_sum : out STD_LOGIC_VECTOR (3 downto 0);
           rc_cout : out STD_LOGIC);
end component;
Signal inp_vec: std_logic_vector(8 downto 0);
Signal output: std_logic_vector(4 downto 0);
begin
uut: rc_adder_4bit port map(rc_a=>inp_vec(7 downto 4),rc_b=>inp_vec(3 downto 0),rc_cin=>inp_vec(8),rc_sum=>output(4 downto 1),rc_cout=>output(0));

test: process
begin
    -- Test case 1: 0 + 0 + 0 = 0
    inp_vec<="000000000";
    wait for 10 ns;
    
    -- Test case 2: 1 + 1 + 0 = 2
    inp_vec<="000100010";
    wait for 10 ns;
    
    -- Test case 3: 5 + 3 + 1 = 9
    inp_vec<="010100111";
    wait for 10 ns;
    
    -- Test case 4: 15 + 15 + 1 = 31 (with carry)
    inp_vec<="111111111";
    wait for 10 ns;
    
    end process test;
end Behavioral;
