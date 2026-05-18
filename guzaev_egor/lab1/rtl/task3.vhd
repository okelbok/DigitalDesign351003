
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity task3 is
    Port (
        sw  : in  std_logic_vector(15 downto 0);  -- используем младшие 8 бит
        led : out std_logic_vector(15 downto 0)
    );
end task3;
--вариант 5 K = 31B6(16) = 11 0001 1011 0110(2) = 14 бит I = D5 J = 7A F = 31B6 A = and B = + C = >>3 D = nor G = Грея (7 бит) L = 6420
architecture Behavioral of task3 is
    constant I : std_logic_vector(7 downto 0) := x"D5"; -- 11010101
    constant J : std_logic_vector(7 downto 0) := x"7A"; -- 01111010
begin

    -- булева операция: led_o[7:0] = sw_i[7:0] XOR I
    led(7 downto 0) <= sw(7 downto 0) xor I     ;

    -- остальные биты J, чтобы все 16 LED что?то показывали:
    led(15 downto 8) <= J;  -- например, дублируем J на старшие 8 светодиодов

end Behavioral;
