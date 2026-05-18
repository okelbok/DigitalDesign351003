library ieee;
use ieee.std_logic_1164.all;

entity MUX2 is
    port (
        A, B, S  : in    std_logic;
        F       : out   std_logic
    );
end MUX2;

architecture rtl of MUX2 is
begin
    F <= A when S = '0' else B;
end rtl;