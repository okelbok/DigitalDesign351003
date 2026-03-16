library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR2 is
    port (
        X1, X2  : in    std_logic;
        Y       : out   std_logic
    );
end entity XOR2;

architecture RTL of XOR2 is
begin
    Y <= X1 xor X2;
end RTL;