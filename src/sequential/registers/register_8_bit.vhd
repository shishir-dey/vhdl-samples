----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Sequential Logic - Registers
-- Module Name: register_8_bit
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: 8-bit general purpose register implementation
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

entity register_8_bit is
    Port ( Data : in STD_LOGIC_VECTOR (7 downto 0);
           LOAD : in STD_LOGIC;
           HALT : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC);
end register_8_bit;

architecture Behavioral of register_8_bit is

begin
process(Data,LOAD,HALT,clk)
begin
    if(LOAD='1') then
    if(clk' event and clk='1') then
        Output <= Data;
        end if;
        end if;
end process;

end Behavioral;
