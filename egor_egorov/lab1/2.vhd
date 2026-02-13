library ieee;
use ieee.std_logic_1164.all;

entity testTop is
  port (
    sw : in  std_logic_vector(15 downto 0);
    led_o : out std_logic_vector(15 downto 0)
  );
end testTop;

architecture rtl of testTop is
begin
  led_o <= sw;
end rtl;