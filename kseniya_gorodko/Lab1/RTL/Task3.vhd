library ieee;
use ieee.std_logic_1164.all;

entity comb_led_unit is
    port(
        led_o: out std_logic_vector(15 downto 0);
        sw_i: in std_logic_vector(7 downto 0)
    );
end comb_led_unit;

--sw_i=11011101
architecture behaviour of comb_led_unit is
begin
    led_o(15 downto 8) <= "00000000";
    led_o(7 downto 0) <= sw_i xor "01000010";
end behaviour; 