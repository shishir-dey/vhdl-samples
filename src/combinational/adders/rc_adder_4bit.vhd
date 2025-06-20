----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Combinational Logic - Adders
-- Module Name: rc_adder_4bit
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: 4-bit ripple carry adder implementation
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

entity rc_adder_4bit is
    Port ( rc_a : in STD_LOGIC_VECTOR (3 downto 0);
           rc_b : in STD_LOGIC_VECTOR (3 downto 0);
           rc_cin : in STD_LOGIC;
           rc_sum : out STD_LOGIC_VECTOR (3 downto 0);
           rc_cout : out STD_LOGIC);
end rc_adder_4bit;

architecture Structural of rc_adder_4bit is

component fa_dataflow is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry : out STD_LOGIC);
end component;

Signal c1,c2,c3: std_logic;
begin

fa1: fa_dataflow port map(rc_a(0),rc_b(0),rc_cin,rc_sum(0),c1);
fa2: fa_dataflow port map(rc_a(1),rc_b(1),c1,rc_sum(1),c2);
fa3: fa_dataflow port map(rc_a(2),rc_b(2),c2,rc_sum(2),c3);
fa4: fa_dataflow port map(rc_a(3),rc_b(3),c3,rc_sum(3),rc_cout);


end Structural;
