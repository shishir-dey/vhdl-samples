----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Sequential Logic - Flip Flops
-- Module Name: t_flip_flop
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: T flip-flop (toggle) implementation
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

entity t_flip_flop is
    Port ( T : in STD_LOGIC;
           en : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : inout STD_LOGIC);
end t_flip_flop;

architecture Behavioral of t_flip_flop is

begin
process(T,en,clk)
begin
    if(en='1') then
        if(rising_edge(clk)) then
            Q <= not T;
            end if;
    else
        Q <= Q;
    end if;
end process;
end Behavioral;
