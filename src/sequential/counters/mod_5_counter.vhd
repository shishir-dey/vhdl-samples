----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Sequential Logic - Counters
-- Module Name: mod_5_counter
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: Modulo-5 counter implementation
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

entity mod_5_down_counter is
    Port ( Input : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (2 downto 0));
end mod_5_down_counter;

architecture rtl of mod_5_down_counter is
Type myType is (s0,s1,s2,s3,s4);
Signal state: myType:=s4;
begin
process(Input,State,CLK)   --process for transfer function
begin
    if(Input='0') then
        state <= state;
    else
        if(rising_edge(CLK)) then
            case state is
                when s4 => state <= s3;
                when s3 => state <= s2;
                when s2 => state <= s1;
                when s1 => state <= s0;
                when others => state <= s4;
            end case;
        end if;
       end if;
end process;

process(state)   --process for output function
begin
    case state is
        when s0 => Output <= "000";
        when s1 => Output <= "001";
        when s2 => Output <= "010";
        when s3 => Output <= "011";
        when s4 => Output <= "100";
        end case;
end process;
end rtl;
