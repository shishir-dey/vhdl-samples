----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/28/2017 03:54:12 PM
-- Design Name: 
-- Module Name: rc_adder_testbench - Behavioral
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rc_adder_testbench is
--  Port ( );
end rc_adder_testbench;

architecture Behavioral of rc_adder_testbench is
component rc_adder_4bit is
    Port ( rc_a : in STD_LOGIC_VECTOR (3 downto 0);
           rc_b : in STD_LOGIC_VECTOR (3 downto 0);
           rc_cin : in STD_LOGIC;
           rc_sum : out STD_LOGIC_VECTOR (3 downto 0);
           rc_cout : out STD_LOGIC);
end component;
Signal inp_vec: std_logic_vector(8 downto 0);
Signal output: std_logic_vector(4 downto 0);
begin
uut: rc_adder_4bit port map(rc_a=>inp_vec(7 downto 4),rc_b=>inp_vec(3 downto 0),rc_cin=>inp_vec(8),rc_sum=>output(4 downto 1),rc_cout=>output(0));

test: process
begin
    inp_vec<="000000001";
    wait for 10ns;
    for i in 1 to 111111111 loop
        inp_vec<=inp_vec+'1';
        wait for 10ns;
    end loop;
    end process test;
end Behavioral;
