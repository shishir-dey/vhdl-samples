----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Basic Logic Gates
-- Module Name: or_gate_tb
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: Testbench for 4-input OR gate implementation using behavioral modeling
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

entity or_gate_tb is
end or_gate_tb;

architecture Behavioral of or_gate_tb is
    -- Component declaration
    component or_gate is
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               C : in STD_LOGIC;
               D : in STD_LOGIC;
               O : out STD_LOGIC);
    end component;
    
    -- Test signals
    signal A, B, C, D : STD_LOGIC := '0';
    signal O : STD_LOGIC;
    
begin
    -- Unit under test instantiation
    uut: or_gate port map (
        A => A,
        B => B,
        C => C,
        D => D,
        O => O
    );
    
    -- Test process
    test_process: process
    begin
        -- Test all 16 possible combinations
        A <= '0'; B <= '0'; C <= '0'; D <= '0'; wait for 10 ns;
        assert O = '0' report "Test 0000 failed" severity error;
        
        A <= '0'; B <= '0'; C <= '0'; D <= '1'; wait for 10 ns;
        assert O = '1' report "Test 0001 failed" severity error;
        
        A <= '0'; B <= '0'; C <= '1'; D <= '0'; wait for 10 ns;
        assert O = '1' report "Test 0010 failed" severity error;
        
        A <= '0'; B <= '0'; C <= '1'; D <= '1'; wait for 10 ns;
        assert O = '1' report "Test 0011 failed" severity error;
        
        A <= '0'; B <= '1'; C <= '0'; D <= '0'; wait for 10 ns;
        assert O = '1' report "Test 0100 failed" severity error;
        
        A <= '0'; B <= '1'; C <= '0'; D <= '1'; wait for 10 ns;
        assert O = '1' report "Test 0101 failed" severity error;
        
        A <= '0'; B <= '1'; C <= '1'; D <= '0'; wait for 10 ns;
        assert O = '1' report "Test 0110 failed" severity error;
        
        A <= '0'; B <= '1'; C <= '1'; D <= '1'; wait for 10 ns;
        assert O = '1' report "Test 0111 failed" severity error;
        
        A <= '1'; B <= '0'; C <= '0'; D <= '0'; wait for 10 ns;
        assert O = '1' report "Test 1000 failed" severity error;
        
        A <= '1'; B <= '0'; C <= '0'; D <= '1'; wait for 10 ns;
        assert O = '1' report "Test 1001 failed" severity error;
        
        A <= '1'; B <= '0'; C <= '1'; D <= '0'; wait for 10 ns;
        assert O = '1' report "Test 1010 failed" severity error;
        
        A <= '1'; B <= '0'; C <= '1'; D <= '1'; wait for 10 ns;
        assert O = '1' report "Test 1011 failed" severity error;
        
        A <= '1'; B <= '1'; C <= '0'; D <= '0'; wait for 10 ns;
        assert O = '1' report "Test 1100 failed" severity error;
        
        A <= '1'; B <= '1'; C <= '0'; D <= '1'; wait for 10 ns;
        assert O = '1' report "Test 1101 failed" severity error;
        
        A <= '1'; B <= '1'; C <= '1'; D <= '0'; wait for 10 ns;
        assert O = '1' report "Test 1110 failed" severity error;
        
        A <= '1'; B <= '1'; C <= '1'; D <= '1'; wait for 10 ns;
        assert O = '1' report "Test 1111 failed" severity error;
        
        report "OR Gate test completed successfully!" severity note;
        wait;
    end process;
    
end Behavioral; 