library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INV is
    port (
        X   : in    std_logic;
        Y   : out   std_logic
    );
end INV;

architecture RTL of INV is
begin
    Y <= not X;
end RTL; 