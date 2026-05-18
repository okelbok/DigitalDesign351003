library ieee;
use ieee.std_logic_1164.all;

entity test_top is
    port (
        led_o: out std_logic_vector(15 downto 0)
        );
end test_top;

architecture rtl of test_top is
begin
    led_o <= "1001101100100010";
end rtl;