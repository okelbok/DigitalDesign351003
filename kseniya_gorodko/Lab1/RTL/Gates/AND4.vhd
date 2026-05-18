library ieee;
use ieee.std_logic_1164.all;

entity AND4 is
    port(
        a, b, c, d: in std_logic;
        z: out std_logic
    );
end AND4;

architecture behaviour of AND4 is
begin
    z <= a and b and c and d;
end behaviour;