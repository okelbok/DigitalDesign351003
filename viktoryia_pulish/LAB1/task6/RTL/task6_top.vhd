library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity converter is
    port (
        sw_i  : in  std_logic_vector(4 downto 0);
        led_o : out std_logic_vector(4 downto 0)
    );
end converter;

architecture rtl of converter is
    signal F0, F1, F2, F3, F4 : std_logic;
begin

    F4 <= '0';

    F3 <= (sw_i(4) and sw_i(3) and sw_i(2) and not sw_i(1) and sw_i(0)) or
          (sw_i(4) and sw_i(3) and sw_i(2) and sw_i(1) and not sw_i(0));

    F2 <= (sw_i(4) and not sw_i(3) and sw_i(2) and sw_i(1) and sw_i(0)) or
          (sw_i(4) and sw_i(3) and not sw_i(2) and sw_i(1) and sw_i(0));

    F1 <= (not sw_i(4) and sw_i(3) and sw_i(2) and sw_i(1) and sw_i(0)) or
          (sw_i(4) and sw_i(3) and not sw_i(2) and sw_i(1) and sw_i(0)) or
          (sw_i(4) and sw_i(3) and sw_i(2) and sw_i(1) and not sw_i(0));

    F0 <= (not sw_i(4) and sw_i(3) and sw_i(2) and sw_i(1) and sw_i(0)) or
          (sw_i(4) and not sw_i(3) and sw_i(2) and sw_i(1) and sw_i(0)) or
          (sw_i(4) and sw_i(3) and sw_i(2) and not sw_i(1) and sw_i(0));

    led_o <= F4 & F3 & F2 & F1 & F0;

end rtl;
