----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Combinational Logic - Decoders
-- Module Name: decoder_2x4_testbench
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: Testbench for 2-to-4 line decoder with enable signal
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

-- Component instantiation
uut: decoder_2x4 port map (
    input => inp_vector(1 downto 0),
    en => inp_vector(2),
    output => out_vector
);

test: process
    begin
    inp_vector<="000";
    wait for 10 ns;
    
    inp_vector<="001";
    wait for 10 ns;
        
    inp_vector<="010";
    wait for 10 ns;
            
    inp_vector<="011";
    wait for 10 ns;
                
    inp_vector<="100";
    wait for 10 ns;
                    
    inp_vector<="101";
    wait for 10 ns;
                        
    inp_vector<="110";
    wait for 10 ns;
                            
    inp_vector<="111";
    wait for 10 ns;
    
    end process test;
end Behavioral;
