library ieee;
use ieee.std_logic_1164.all;

entity OR3 is
    port(
        a, b, c: in std_logic;
        z: out std_logic
    );
end OR3;

architecture behaviour of OR3 is
begin
    z <= a or b or c;
end behaviour;