library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOR2 is
    port (
        X1, X2  : in    std_logic;
        Y       : out   std_logic
    );
end entity NOR2;

architecture RTL of NOR2 is
begin
    Y <= X1 nor X2;
end RTL;