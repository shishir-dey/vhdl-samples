----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/28/2017 03:40:19 PM
-- Design Name: 
-- Module Name: fa_testbench - Behavioral
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
    wait for 100ns;
    
    inp_vec<="001";
    wait for 100ns;
        
    
     inp_vec<="010";
     wait for 100ns;
            
            
      inp_vec<="011";
      wait for 100ns;
                
                
      inp_vec<="100";
      wait for 100ns;
                    
                    
      inp_vec<="101";
      wait for 100ns;
                               
      inp_vec<="110";
      wait for 100ns;
                            
                            
      inp_vec<="111";
      wait for 100ns;
       
   end process test;                         
end Behavioral;
