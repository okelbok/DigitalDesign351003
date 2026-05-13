library ieee;
use ieee.std_logic_1164.all;

entity OR5 is
    port (
        X1, X2, X3, X4, X5  : in    std_logic;
        Y                   : out   std_logic
    );
end OR5;

architecture rtl of OR5 is
begin
    Y <= X1 or X2 or X3 or X4 or X5;
end rtl;