library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR2 is
    port (
        X1, X2  : in    std_logic;
        Y       : out   std_logic
    );
end entity OR2;

architecture RTL of OR2 is
begin
    Y <= X1 or X2;
end RTL;