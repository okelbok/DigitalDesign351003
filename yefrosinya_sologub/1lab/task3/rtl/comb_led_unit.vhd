library IEEE;
use ieee.std_logic_1164.all;

entity comb_led_unit is 
 port(
 led_o : out std_logic_vector(15 downto 0);
 sw_i : in std_logic_vector(7 downto 0)
 );
end comb_led_unit;
 
architecture rtl of comb_led_unit is
begin
 led_o <= "00000000" & (sw_i XOR "00111101");
end rtl;