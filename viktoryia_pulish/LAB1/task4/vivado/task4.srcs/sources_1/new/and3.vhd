library ieee;
use ieee.std_logic_1164.all;

entity AND3 is
    port (
        A : in std_logic;
        B : in std_logic;
        C : in std_logic;
        Y : out std_logic
    );
end AND3;

architecture rtl of AND3 is
begin
    Y <= A and B and C;
end rtl;