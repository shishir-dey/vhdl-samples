----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/22/2017 02:55:59 PM
-- Design Name: 
-- Module Name: sr_latch - Dataflow
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

entity sr_latch is
    Port ( S : in STD_LOGIC;
           R : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qx : out STD_LOGIC);
end sr_latch;

architecture Dataflow of sr_latch is
Signal q_temp :std_logic;
Signal qx_temp :std_logic;
begin
q_temp <= R nor qx_temp;
qx_temp <= S nor q_temp;

Q <= q_temp;
Qx <= qx_temp; 
end Dataflow;
