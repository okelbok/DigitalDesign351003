library ieee;
use ieee.std_logic_1164.all;

entity AND3 is
    port (
        X1, X2, X3  : in    std_logic;
        Y           : out   std_logic
    );
end AND3;

architecture rtl of AND3 is
begin
    Y <= X1 and X2 and X3;
end rtl;