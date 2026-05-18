library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND2 is
    port (
        X1, X2  : in    std_logic;
        Y       : out   std_logic
    );
end AND2;

architecture RTL of AND2 is
begin
    Y <= X1 and X2;
end RTL; 