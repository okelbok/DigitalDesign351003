library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Task6 is
    port (
        sw_i    : in    std_logic_vector(15 downto 0);
        led_o   : out   std_logic_vector(15 downto 0)
    );
end Task6;

architecture Structural of Task6 is
    component BISTABLE_C is
        port (
            S   : in    std_logic;
            R   : in    std_logic;
            nQ  : out   std_logic;
            Q   : out   std_logic
        );
     end component;
begin
    led_o(15 downto 3) <= (others => '0');

    BISTABLE: BISTABLE_C port map (
        S => sw_i(1),
        R => sw_i(0),
        nQ => led_o(1),
        Q => led_o(0)
    );
end Structural;