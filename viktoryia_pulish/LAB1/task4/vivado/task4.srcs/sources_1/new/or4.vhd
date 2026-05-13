library ieee;
use ieee.std_logic_1164.all;

entity OR4 is
    port (
        A : in std_logic;
        B : in std_logic;
        C : in std_logic;
        D : in std_logic;
        Y : out std_logic
    );
end OR4;

architecture rtl of OR4 is
begin
    Y <= A or B or C or D;
end rtl;