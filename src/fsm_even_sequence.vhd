----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/23/2017 02:47:53 PM
-- Design Name: 
-- Module Name: fsm_even_sequence - rtl
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
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
