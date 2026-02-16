----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.02.2026 03:12:21
-- Design Name: 
-- Module Name: task5 - Behavioral
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
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity task5 is
port(
sw_i    : in std_logic_vector (15 downto 0);
led_o   : out std_logic_vector (5 downto 0)
);
end task5;

architecture Behavioral of task5 is
begin
p1: process(sw_i(3 downto 0))
variable num1, num2, result : unsigned(5 downto 0);
begin  
num1 := unsigned(sw_i(15 downto 10));
num2 := unsigned(sw_i(9 downto 4));

case sw_i(3 downto 0) is
when "0001" =>
    result := num1 nand num2;
when "0010" =>
    result := num1 - num2;
when "0100" =>
    result := num1 sll 1;
when "1000" =>
    result := num1 xor num2;
when others =>
    result := "000000";
end case;

led_o <= std_logic_vector(result);
end process;
end Behavioral;
