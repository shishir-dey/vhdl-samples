----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Sequential Logic - State Machines
-- Module Name: fsm_even_sequence
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: Finite state machine for even sequence detection
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

entity fsm_even_sequence is
    Port ( Data : in STD_LOGIC;
           Input : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Output : out STD_LOGIC);
end fsm_even_sequence;

architecture rtl of fsm_even_sequence is
Type myType is (even,odd);
Signal state: myType:=even;
Signal temp_data:std_logic:='0';
begin
process(Input,CLK,state)   --process for transfer function
begin
    if(Input='0') then
        state <= state;
    else
            if(rising_edge(CLK) and (temp_data=not Data))then
                temp_data <= Data;
                if(state=even) then state<=odd;
                elsif(state=odd)then state<=even;
                end if;
            end if;
    end if;
                
end process;

process(state)   --process for output function
begin
    case state is
        when odd => Output <= '0';
        when even => Output <= '1';
        end case;
end process;
end rtl;
