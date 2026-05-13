----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.02.2026 00:39:23
-- Design Name: 
-- Module Name: task3 - Behavioral
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
--я чейчас заплачу что за бред почему постоянно ошибки(((
entity comb_led_unit is
port (
sw_i    :in std_logic_vector(7 downto 0);
led_o   :out std_logic_vector(15 downto 0)
);
end comb_led_unit;

architecture Behavioral of comb_led_unit is
constant my_num    :std_logic_vector(7 downto 0) := "11000011";
constant zeroes :std_logic_vector(7 downto 0) := "00000000";
signal buf  :std_logic_vector(7 downto 0);
begin
buf <= sw_i xor my_num;
led_o <= zeroes & buf;
end Behavioral;
