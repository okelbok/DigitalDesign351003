library ieee;
use ieee.std_logic_1164.all;

--F=2FBC
--y = (a+b+c)(b+c+Nd)(a+b+Nd)(Na+Nb+Nc)

entity function_unit is
    port(
        led_o: out std_logic;
        sw_i: in std_logic_vector (3 downto 0)
    );
end function_unit;

architecture structural of function_unit is
component AND4
    port(
        a, b, c, d: in std_logic;
        z: out std_logic
    );
end component;
component OR3
    port(
        a, b, c: in std_logic;
        z: out std_logic
    );
end component;
component INV
    port(
        a: in std_logic;
        z: out std_logic
    );
end component;
signal s: std_logic_vector(8 downto 0);
begin
    u1: INV port map(a => sw_i(0), z => s(0));
    u2: INV port map(a => sw_i(1), z => s(1));
    u3: INV port map(a => sw_i(2), z => s(2));
    u4: INV port map(a => sw_i(3), z => s(3));
    u5: OR3 port map(a => sw_i(3), b => sw_i(2), c => sw_i(1), z => s(4));
    u6: OR3 port map(a => sw_i(2), b => sw_i(1), c => s(0), z => s(5));
    u7: OR3 port map(a => sw_i(3), b => sw_i(2), c => s(0), z => s(6));
    u8: OR3 port map(a => s(3), b => s(2), c => s(1), z => s(7));
    u9: AND4 port map(a => s(4), b => s(5), c => s(6), d => s(7), z => s(8));
    led_o <= s(8);
end structural;