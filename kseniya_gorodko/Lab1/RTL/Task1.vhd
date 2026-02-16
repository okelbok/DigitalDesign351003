library ieee;
use ieee.std_logic_1164.all;

entity led_const is
    port(
        led_o: out std_logic_vector(15 downto 0)
    );
end led_const;

architecture behaviour of led_const is
begin
-- e8d5
    led_o <= "1110100011010101";
end behaviour;