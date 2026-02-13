library IEEE;
use ieee.std_logic_1164.all;

entity OR2_gate is
 port (
  X1, X2 : in std_logic;
  O : out std_logic
  ); 
end OR2_gate;

architecture rtl of OR2_gate is
begin
 O <= X1 or X2;
end rtl;