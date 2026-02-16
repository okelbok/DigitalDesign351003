library ieee;
use ieee.std_logic_1164.all;

entity INV is
    port(
        a: in std_logic;
        z: out std_logic
    );
end INV;

architecture behaviour of INV is
begin
    z <= not a;
end behaviour;