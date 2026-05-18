library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- I = 23(hex) = 0010 0011
--           XOR 1001 0000                       
-- J = B3(hex) = 1011 0011

entity comb_led_unit is
    port (
            sw_i  : in  STD_LOGIC_VECTOR (7 downto 0);
            led_o : out STD_LOGIC_VECTOR (15 downto 0)
        );
end comb_led_unit;

architecture rtl of comb_led_unit is
    constant I_VAL : std_logic_vector(7 downto 0) := X"23";
    signal J_result : std_logic_vector(7 downto 0);
begin
    J_result <= sw_i XOR I_VAL;
    led_o(7 downto 0) <= J_result;
    led_o(15 downto 8) <= "00000000";
end rtl;
