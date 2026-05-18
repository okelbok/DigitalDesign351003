library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity task7 is
  port(
    sw_i  : in  std_logic_vector(3 downto 0);
    led_o : out std_logic_vector(1 downto 0)
  );
end entity;

architecture structural of task7 is
  component MUX2 is
    port(A, B, S : in  std_logic;
         F    : out std_logic);
  end component;

begin
  MUX2_0 : MUX2 port map(
    A => sw_i(1),
    B => '1',
    S => sw_i(2),
    F => led_o(0)
  );

  MUX2_1 : MUX2 port map(
    A => sw_i(2),
    B => '1',
    S => sw_i(3),
    F => led_o(1)
  );
end architecture;