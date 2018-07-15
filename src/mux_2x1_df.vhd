----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/20/2017 03:32:58 PM
-- Design Name: 
-- Module Name: mux_2x1_df - Dataflow
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

entity mux_2x1_df is
    Port ( d0 : in STD_LOGIC;
           d1 : in STD_LOGIC;
           sel : in STD_LOGIC;
           output : out STD_LOGIC);
end mux_2x1_df;

architecture Dataflow of mux_2x1_df is

begin
output <= ((not sel) and d0) or (sel and d1);
end Dataflow;
