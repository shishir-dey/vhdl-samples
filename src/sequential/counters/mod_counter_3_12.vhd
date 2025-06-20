----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Sequential Logic - Counters
-- Module Name: mod_counter_3_12
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: 3-bit modulo-12 counter implementation
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod_counter_3_12 is
    Port ( Input_C : in STD_LOGIC_VECTOR (3 downto 0);
           CLR_C : in STD_LOGIC;
           CLK_C : in STD_LOGIC;
           CNT_C : in STD_LOGIC;
           LD_C : in STD_LOGIC;
           TC_C : out INTEGER;
           Output_C : out STD_LOGIC_VECTOR (3 downto 0));
end mod_counter_3_12;

architecture Behavioral of mod_counter_3_12 is
component pipo_4bit_behave is
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           CLR : in STD_LOGIC;
           CLK : in STD_LOGIC;
           CNT : in STD_LOGIC;
           LD : in STD_LOGIC;
           TC : out INTEGER;
           Output : out STD_LOGIC_VECTOR (3 downto 0));
end component;
Signal clear: std_logic;--:=(not save(3)) and (not save(2)) and save(1) and save(0);
begin
count1: pipo_4bit_behave port map(Input_C,clear,CLK_C,'1','0',TC_C,Output_C);
end Behavioral;

