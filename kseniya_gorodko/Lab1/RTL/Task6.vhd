library ieee;
use ieee.std_logic_1164.all;

entity code_unit is
    port(
        led_o: out std_logic_vector(3 downto 0);
        sw_i: in std_logic_vector(3 downto 0)
    );
end code_unit;

--y0 = x0;
--y1 = Nx3Nx2x1 + x3x2Nx1
--y2 = x2Nx1Nx0 + x3Nx2x1x0 + x3x2Nx1
--y3 = x3x2x1

architecture behaviour of code_unit is
begin
    led_o(0) <= sw_i(0);
    led_o(1) <= ((not sw_i(3)) and (not sw_i(2)) and sw_i(1)) or (sw_i(3) and sw_i(2) and (not sw_i(1)));
    led_o(2) <= (sw_i(2) and (not sw_i(1)) and (not sw_i(0))) or (sw_i(3) and (not sw_i(2)) and sw_i(1) and sw_i(0))
                or (sw_i(3) and sw_i(2) and (not sw_i(1)));
    led_o(3) <= sw_i(3) and sw_i(2) and sw_i(1);
end behaviour; 