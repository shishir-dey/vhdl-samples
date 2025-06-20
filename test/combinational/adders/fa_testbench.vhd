----------------------------------------------------------------------------------
-- Engineer: Shishir Dey
-- Create Date: 06/20/2025 03:24:14 PM
-- Design Name: Combinational Logic - Adders
-- Module Name: fa_testbench
-- Project Name: VHDL Digital Design Samples
-- Target Devices: Generic FPGA/ASIC
-- Tool Versions: GHDL 5.0.1, Make 3.81
-- Description: Testbench for fa component
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

entity fa_testbench is
--  Port ( );
end fa_testbench;

architecture Behavioral of fa_testbench is
component fa_behaviour is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry : out STD_LOGIC);
end component;

Signal inp_vec: std_logic_vector(2 downto 0);
Signal out_vec: std_logic_vector(1 downto 0);
begin

uut: fa_behaviour port map(inp_vec(2),inp_vec(1),inp_vec(0),out_vec(1),out_vec(0));
test: process
begin
    inp_vec<="000";
    wait for 100 ns;
    
    inp_vec<="001";
    wait for 100 ns;
        
    
     inp_vec<="010";
     wait for 100 ns;
            
            
      inp_vec<="011";
      wait for 100 ns;
                
                
      inp_vec<="100";
      wait for 100 ns;
                    
                    
      inp_vec<="101";
      wait for 100 ns;
                               
      inp_vec<="110";
      wait for 100 ns;
                            
                            
      inp_vec<="111";
      wait for 100 ns;
       
   end process test;                         
end Behavioral;
