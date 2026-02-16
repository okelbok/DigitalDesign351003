library ieee;
use ieee.std_logic_1164.all;

entity sw_led_unit is
    port(
        led_o: out std_logic_vector(15 downto 0);
        sw_i: in std_logic_vector(15 downto 0)
    );
end sw_led_unit;

architecture behaviour of sw_led_unit is
begin
    led_o <= sw_i;
end behaviour;