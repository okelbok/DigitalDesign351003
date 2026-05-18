library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOT_gate is
    port (
        A : in  std_logic;
        O : out std_logic
    );
end NOT_gate;

architecture RTL of NOT_gate is
begin
    O <= not A;
end RTL;
