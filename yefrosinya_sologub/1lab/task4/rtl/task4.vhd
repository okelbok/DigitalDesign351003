library IEEE;
use ieee.std_logic_1164.all;

entity task4 is 
 port(
  led_o : out std_logic;
  sw_i : in std_logic_vector(3 downto 0)
 );
end task4;
 
architecture Structural of task4 is
 component AND2_gate is
  port (X1, X2 : in std_logic; O : out std_logic);
 end component;
 
 component OR3_gate is
  port (X1, X2, X3 : in std_logic; O : out std_logic);
 end component;
 
 component OR2_gate is
  port (X1, X2 : in std_logic; O : out std_logic);
 end component;
 
 component NOT_gate is
  port (X1 : in std_logic; O : out std_logic);
 end component;
 
 signal not0, not1, not3, and1, and2, and3, and4, or1 : std_logic;

begin
 -- X0'
 U1: NOT_gate port map (
  X1 => sw_i(0),
   O => not0
 );
 
 -- X1'
 U2: NOT_gate port map (
  X1 => sw_i(1),
  O => not1
 );
 
 -- X3'
 U3: NOT_gate port map (
  X1 => sw_i(3),
  O => not3
 );
 
 --X1*X2
 U4: AND2_gate port map (
  X1 => sw_i(1),
  X2 => sw_i(2),
  O => and1
 );
 
 --X0'*X1'
 U5: AND2_gate port map (
  X1 => not0,
  X2 => not1,
  O => and2
 );
 
 --X0*X1
 U6: AND2_gate port map (
  X1 => sw_i(0),
  X2 => sw_i(1),
  O => and3
 );
 
 --X2+X0'*X1'+X0*X1
 U7: OR3_gate port map (
  X1 => sw_i(2),
  X2 => and2,
  X3 => and3,
  O => or1
 );
 
 --X3'*(X2+X0'*X1'+X0*X1)
 U8: AND2_gate port map (
   X1 => not3,
   X2 => or1,
   O => and4
 );
 
 -- X1*X2+X3'*(X2+X0'*X1'+X0*X1)
 U9: OR2_gate port map (
  X1 => and1,
  X2 => and4,
  O => led_o
 );
 
end architecture;