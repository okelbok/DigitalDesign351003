library ieee;
use ieee.std_logic_1164.all;

entity testTop is
  port (
    led_o : out std_logic_vector(15 downto 0)
  );
end testTop;

architecture rtl of testTop is
  constant K_VALUE : std_logic_vector(15 downto 0) := x"C0F9";
begin
  led_o <= K_VALUE;
end rtl;