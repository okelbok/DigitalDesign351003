library IEEE;
use ieee.std_logic_1164.all;

entity converter_task6 is
 port (
  sw_i : in std_logic_vector(3 downto 0);
  led_o : out std_logic_vector(3 downto 0)
 );
end converter_task6;

architecture rtl of converter_task6 is
 signal F0, F1, F2, F3 : std_logic;
begin 
 F0 <= ((not sw_i(0)) and (sw_i(3) or (sw_i(1) and (not sw_i(2))))) or (sw_i(0) and (not sw_i(1)) and (not sw_i(3)));
 F1 <= ((not sw_i(0)) and (not sw_i(1)) and sw_i(2)) or (sw_i(1) and (not sw_i(2)));
 F2 <= (sw_i(0) and sw_i(3)) or (sw_i(1) and (not sw_i(0)) and sw_i(2));
 F3 <= sw_i(2) and ((not sw_i(1)) or sw_i(0));
 led_o <= F3 & F2 & F1 & F0;
end rtl;