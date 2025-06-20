----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Sequential Logic - Flip Flops
-- Module Name: d_flip_flop_tb
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: Testbench for D flip-flop implementation with edge triggering
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

entity d_flip_flop_tb is
end d_flip_flop_tb;

architecture Behavioral of d_flip_flop_tb is
    -- Component declaration
    component d_flip_flop is
        Port ( D : in STD_LOGIC;
               clk : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;
    
    -- Test signals
    signal D : STD_LOGIC := '0';
    signal clk : STD_LOGIC := '0';
    signal Q : STD_LOGIC;
    
    -- Clock period definition
    constant clk_period : time := 10 ns;
    
begin
    -- Unit under test instantiation
    uut: d_flip_flop port map (
        D => D,
        clk => clk,
        Q => Q
    );
    
    -- Clock process
    clk_process: process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
    
    -- Test process
    test_process: process
    begin
        -- Wait for global reset
        wait for 20 ns;
        
        -- Test 1: D=0 at rising edge
        D <= '0';
        wait for clk_period;
        assert Q = '0' report "Test 1 failed: Q should be 0 when D=0" severity error;
        
        -- Test 2: D=1 at rising edge  
        D <= '1';
        wait for clk_period;
        assert Q = '1' report "Test 2 failed: Q should be 1 when D=1" severity error;
        
        -- Test 3: D changes between clock edges (should not affect Q)
        wait for clk_period/4;
        D <= '0';
        wait for clk_period/4;
        assert Q = '1' report "Test 3 failed: Q should remain 1 when D changes between edges" severity error;
        
        -- Test 4: D=0 at next rising edge
        wait for clk_period/2;
        assert Q = '0' report "Test 4 failed: Q should be 0 after clock edge with D=0" severity error;
        
        -- Test 5: Multiple transitions
        D <= '1';
        wait for clk_period;
        assert Q = '1' report "Test 5a failed" severity error;
        
        D <= '0';
        wait for clk_period;
        assert Q = '0' report "Test 5b failed" severity error;
        
        D <= '1';
        wait for clk_period;
        assert Q = '1' report "Test 5c failed" severity error;
        
        report "D Flip-Flop test completed successfully!" severity note;
        wait;
    end process;
    
end Behavioral; 