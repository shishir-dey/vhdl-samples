----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Combinational Logic - Multiplexers
-- Module Name: mux_2x1_tb
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: Testbench for mux_2x1 component
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

entity mux_2x1_tb is
end mux_2x1_tb;

architecture Behavioral of mux_2x1_tb is
    -- Component declaration
    component mux_2x1_df is
        Port ( d0 : in STD_LOGIC;
               d1 : in STD_LOGIC;
               sel : in STD_LOGIC;
               output : out STD_LOGIC);
    end component;
    
    -- Test signals
    signal d0, d1, sel : STD_LOGIC := '0';
    signal output : STD_LOGIC;
    
begin
    -- Unit under test instantiation
    uut: mux_2x1_df port map (
        d0 => d0,
        d1 => d1,
        sel => sel,
        output => output
    );
    
    -- Test process
    test_process: process
    begin
        -- Test all 8 possible combinations
        
        -- Test 1: sel=0, d0=0, d1=0 -> output should be d0=0
        sel <= '0'; d0 <= '0'; d1 <= '0'; wait for 10 ns;
        assert output = '0' report "Test 1 failed: sel=0, d0=0, d1=0" severity error;
        
        -- Test 2: sel=0, d0=0, d1=1 -> output should be d0=0
        sel <= '0'; d0 <= '0'; d1 <= '1'; wait for 10 ns;
        assert output = '0' report "Test 2 failed: sel=0, d0=0, d1=1" severity error;
        
        -- Test 3: sel=0, d0=1, d1=0 -> output should be d0=1
        sel <= '0'; d0 <= '1'; d1 <= '0'; wait for 10 ns;
        assert output = '1' report "Test 3 failed: sel=0, d0=1, d1=0" severity error;
        
        -- Test 4: sel=0, d0=1, d1=1 -> output should be d0=1
        sel <= '0'; d0 <= '1'; d1 <= '1'; wait for 10 ns;
        assert output = '1' report "Test 4 failed: sel=0, d0=1, d1=1" severity error;
        
        -- Test 5: sel=1, d0=0, d1=0 -> output should be d1=0
        sel <= '1'; d0 <= '0'; d1 <= '0'; wait for 10 ns;
        assert output = '0' report "Test 5 failed: sel=1, d0=0, d1=0" severity error;
        
        -- Test 6: sel=1, d0=0, d1=1 -> output should be d1=1
        sel <= '1'; d0 <= '0'; d1 <= '1'; wait for 10 ns;
        assert output = '1' report "Test 6 failed: sel=1, d0=0, d1=1" severity error;
        
        -- Test 7: sel=1, d0=1, d1=0 -> output should be d1=0
        sel <= '1'; d0 <= '1'; d1 <= '0'; wait for 10 ns;
        assert output = '0' report "Test 7 failed: sel=1, d0=1, d1=0" severity error;
        
        -- Test 8: sel=1, d0=1, d1=1 -> output should be d1=1
        sel <= '1'; d0 <= '1'; d1 <= '1'; wait for 10 ns;
        assert output = '1' report "Test 8 failed: sel=1, d0=1, d1=1" severity error;
        
        report "2x1 Multiplexer test completed successfully!" severity note;
        wait;
    end process;
    
end Behavioral; 