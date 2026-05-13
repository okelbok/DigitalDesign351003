
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--вариант  5	K = 31B6(16) = 11 0001 1011 0110(2) = 14 бит 	I = D5	J = 7A	F = 31B6	A = and B = +  C = >>3 D = nor	G = Грея (7 бит)	L = 6420
--  
entity task2 is
    Port (
        led : out std_logic_vector(15 downto 0);
        sw : in std_logic_vector(15 downto 0)
    );

end task2;

architecture Behavioral of task2 is

begin

    led <= sw;

end Behavioral;
