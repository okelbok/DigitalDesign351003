library IEEE;
use ieee.std_logic_1164.all;

entity AND2_gate is
 port (
  X1, X2 : in std_logic;
  O : out std_logic
  ); 
end AND2_gate;

architecture rtl of AND2_gate is
begin
 O <= X1 and X2;
end rtl;