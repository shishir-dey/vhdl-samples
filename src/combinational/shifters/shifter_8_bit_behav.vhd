----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Combinational Logic - Shifters
-- Module Name: shifter_8_bit_behav
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: 8-bit shifter using behavioral modeling
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

entity shifter_8_bit_behav is
    Port ( inp : in STD_LOGIC_VECTOR (7 downto 0);
           xl : in STD_LOGIC;
           xr : in STD_LOGIC;
           S : in STD_LOGIC;
           D : in STD_LOGIC;
           outp : out STD_LOGIC_VECTOR (7 downto 0));
end shifter_8_bit_behav;

architecture Behavioral of shifter_8_bit_behav is

begin
process(inp,xl,xr,S,D)
begin
    if(S='1') then
        if(D='0') then
            for i in 1 to 7 loop
                outp(i-1) <= inp(i);
             end loop;
             outp(7) <= xr;
        else
            outp(0) <= xl;
            for i in 1 to 7 loop
                outp(i)<= inp(i-1);
            end loop;
        end if;
    else
        outp <= inp;
    end if;
end process;
end Behavioral;
