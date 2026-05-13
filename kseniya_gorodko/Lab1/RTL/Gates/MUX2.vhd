library ieee;
use ieee.std_logic_1164.all;

entity MUX2 is
    port(
        a, b, s: in std_logic;
        z: out std_logic
    );
end MUX2;

architecture behaviour of MUX2 is
begin
    z <= a when s = '0' else b;
end behaviour;