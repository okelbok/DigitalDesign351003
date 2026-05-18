library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity task6 is
  port(
    sw_i  : in  std_logic_vector(3 downto 0);
    led_o : out std_logic_vector(1 downto 0)
  );
end entity;

architecture rtl of task6 is
begin
  led_o(0) <= sw_i(1) or sw_i(2);
  led_o(1) <= sw_i(2) or sw_i(3);
end architecture;