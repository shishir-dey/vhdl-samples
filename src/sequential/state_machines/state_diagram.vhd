----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Sequential Logic - State Machines
-- Module Name: state_diagram
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: General finite state machine implementation
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

entity state_diagram is
    Port ( Input : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Output : out STD_LOGIC);
end state_diagram;

architecture rtl of state_diagram is
Type newType is (s0,s1,s2);
Signal state: newType:=s0;
begin
process(Input,State,CLK)   --process for transfer function
begin
    if(Input='0' and rising_edge(clk)) then
        state <= s1;
        output <= '0'; -- 0 = p
    elsif(Input='1' and rising_edge(clk)) then
        case state is
            when s0 => state <= s2;
                        Output <= '1';  -- 1 = q
            when s1 => state <= s0;
                        Output <= '0';   -- 0 = p
            when s2 => state <= s2;
                        Output <= '0';   -- 0 = p
        end case;
    end if;
end process;
end rtl;