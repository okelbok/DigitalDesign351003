library IEEE;
use ieee.std_logic_1164.all;

entity converter_task7 is
 port (
  sw_i : in std_logic_vector(3 downto 0);
  led_o : out std_logic_vector(3 downto 0)
 );
end converter_task7;

architecture Structural of converter_task7 is
 component MUX2_gate is
  port (X0, X1, S : in std_logic; O : out std_logic);
 end component;
 component NOT_gate is
  port (X0 : in std_logic; O : out std_logic);
 end component;
 signal not0, not1, not2, not3, or1, or2, and1, and2, and3, and4, and5, and6, and7, and8, and9, F3, F2, F1, F0 : std_logic;
begin 
 --X0'
 U1: NOT_gate port map (
  X0 => sw_i(0),
  O => not0
 );
 --X1'
 U2: NOT_gate port map (
  X0 => sw_i(1),
  O => not1
 );
 --X2'
 U3: NOT_gate port map (
  X0 => sw_i(2),
  O => not2
 );
 --X3'
 U4: NOT_gate port map (
  X0 => sw_i(3),
  O => not3
 );
 
 --F3: X1'+X0
 U5: MUX2_gate port map (
  X0 => not1,
  X1 => '1',
  S => sw_i(0),
  O => or1
 );
 --F3: X2*(X1'+X0)
 U6: MUX2_gate port map (
  X0 => '0',
  X1 => sw_i(2),
  S => or1,
  O => F3
 );
 
 --F2: X0*X3
 U7: MUX2_gate port map (
  X0 => '0',
  X1 => sw_i(0),
  S => sw_i(3),
  O => and1
 );
 --F2: X1*X0'
 U8: MUX2_gate port map (
  X0 => '0',
  X1 => sw_i(1),
  S => not0,
  O => and2
 );
 --F2: X1*X0'*X2
 U9: MUX2_gate port map (
  X0 => '0',
  X1 => and2,
  S => sw_i(2), 
  O => and3
 );
 --F2: X0*X3+X1*X0'*X2
 U10: MUX2_gate port map (
  X0 => and1,
  X1 => '1',
  S => and3,
  O => F2
 );
 
 --F1: X0'*X1'
 U11: MUX2_gate port map (
  X0 => '0',
  X1 => not0,
  S => not1, 
  O => and4
 );
 --F1: X0'*X1'*X2
 U12: MUX2_gate port map (
  X0 => '0',
  X1 => and4,
  S => sw_i(2),
  O => and5
 );
 --F1: X1*X2' + F0: X1*X2'
 U13: MUX2_gate port map (
  X0 => '0',
  X1 => sw_i(1),
  S => not2,
  O => and6
 );
 --F1: X0'*X1'*X2+X1*X2'
 U14: MUX2_gate port map (
  X0 => and5,
  X1 => '1',
  S => and6,
  O => F1
 );
 --F0: X3+X1*X2'
 U15: MUX2_gate port map (
  X0 => sw_i(3),
  X1 => '1',
  S => and6,
  O => or2
 );
 --F0: X0'*(X3+X1*X2')
 U16: MUX2_gate port map (
  X0 => '0',
  X1 => not0,
  S => or2,
  O => and7
 );
 --F0: X0*X1'
 U17: MUX2_gate port map (
  X0 => '0',
  X1 => sw_i(0),
  S => not1,
  O => and8
 );
 --FO: X0*X1'*X3'
 U18: MUX2_gate port map (
  X0 => '0',
  X1 => and8,
  S => not3,
  O => and9
 );
 --F0: X0'*(X3+X1*X2')+X0*X1'*X3'
 U19: MUX2_gate port map (
  X0 => and7,
  X1 => '1', 
  S => and9,
  O => F0
 );
 led_o <= F3 & F2 & F1 & F0;
end architecture;