----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Sequential Logic - Registers
-- Module Name: pipo_4bit_behave
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: 4-bit PIPO register using behavioral modeling
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pipo_4bit_behave is
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           CLR : in STD_LOGIC;
           CLK : in STD_LOGIC;
           CNT : in STD_LOGIC;
           LD : in STD_LOGIC;
           TC : out INTEGER;
           Output : out STD_LOGIC_VECTOR (3 downto 0));
end pipo_4bit_behave;

architecture Behavioral of pipo_4bit_behave is
Signal save: std_logic_vector(3 downto 0):="0000";
Signal tc_temp: INTEGER:=0;
begin
process(CLK,LD,CLR)
begin
    if(CLR='1') then
        Output <="0000";
        tc_temp <=0;
    else
        if(LD='1') then
            Output <= Input;
            else
                if(CNT='1' and rising_edge(CLK)) then
                    save <= save + '1';
                    if(save="1111") then
                        Output <= save;
                        save <= "0000";
                        tc_temp <= tc_temp + 1;
                        end if;
                end if;
        end if;
    end if;
end process;
end Behavioral;
