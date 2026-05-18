library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INTCON_D is
    generic (
        DELAY       : time  := 10 ns
    );
    port (
        X           : in    std_logic;
        Y           : out   std_logic
    );
end entity INTCON_D;

architecture Behavioral of INTCON_D is
begin
    Y <= transport X after DELAY;
end Behavioral;