library IEEE;
use ieee.std_logic_1164.all;

entity OR3_gate is
 port (
  X1, X2, X3 : in std_logic;
  O : out std_logic
  ); 
end OR3_gate;

architecture rtl of OR3_gate is
begin
 O <= X1 or X2 or X3;
end rtl;