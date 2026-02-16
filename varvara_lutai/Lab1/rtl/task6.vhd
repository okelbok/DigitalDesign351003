----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.02.2026 17:39:04
-- Design Name: 
-- Module Name: task6 - Behavioral
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

entity task6 is
port (
sw_i : in std_logic_vector (3 downto 0);
led_o   : out std_logic_vector (3 downto 0)
);
end task6;

architecture Behavioral of task6 is
signal temp, x3, x2, x1, x0, nx3, nx2, nx1, nx0 : std_logic; 
begin
p1: process (sw_i(3 downto 0))
begin
    case sw_i(3 downto 0) is
        when "0001" =>
        led_o(3 downto 0) <= "0010";
        when "0010" =>
        led_o(3 downto 0) <= "0100";
        when "0111" =>
        led_o(3 downto 0) <= "1010";
        when "1000" =>
        led_o(3 downto 0) <= "1010";
        when "1001" =>
        led_o(3 downto 0) <= "1110";
        when "1010" =>
        led_o(3 downto 0) <= "1110";
        when others =>
        led_o (3 downto 0) <= "0000";
    end case;
end process;

--Второй вариант (просто на всякий)
--x3 <= sw_i(3);
--nx3 <= not(x3);
--x2 <= sw_i(2);
--nx2 <= not(x2);
--x1 <= sw_i(1);
--nx1 <= not(x1);
--x0 <= sw_i(0);
--nx0 <= not(x0);

--temp <= (nx3 and x2 and x1 and x0) or (x3 and nx2 and (nx0 or nx1));
--led_o(3) <= temp;
--led_o(2) <= (nx2 and nx1 and x0) or (nx2 and x1 and nx0);
--led_o(1) <= temp;
--led_o(0) <= '0';
end Behavioral;
