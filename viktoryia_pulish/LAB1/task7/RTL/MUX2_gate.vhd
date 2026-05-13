library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_gate is
    port (
        A   : in  std_logic;  
        B   : in  std_logic;  
        sel : in  std_logic;  
        O   : out std_logic
    );
end MUX2_gate;

architecture RTL of MUX2_gate is
begin
    O <= A when sel = '0' else B;
end RTL;
