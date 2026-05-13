----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.02.2026 00:30:56
-- Design Name: 
-- Module Name: task7 - Structure
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity task7 is
port (
sw_i  :in std_logic_vector (3 downto 0);
led_o   :out std_logic_vector (3 downto 0)
);
end task7;

architecture Structure of task7 is
signal NX1, NX2, NX3, NX0, SU1, SU3, SU4, SU5, SU6, SU7, SU8, SU9, SU10: std_logic;
component INV port (A: in std_logic; B: out std_logic);
end component;
component MUX2 port (A, B, S: in std_logic; C: out std_logic);
end component;
begin
I1: INV port map(A => sw_i(0), B => NX0);
I2: INV port map(A => sw_i(1), B => NX1);
I3: INV port map(A => sw_i(2), B => NX2);
I4: INV port map(A => sw_i(3), B => NX3);

U1: MUX2 port map (A => sw_i(0), B => NX0, S => sw_i(1), C => SU1);
U2: MUX2 port map (A => SU1, B => NX2, S => sw_i(2), C => led_o(2));

U3: MUX2 port map (A => sw_i(1), B => sw_i(0), S => sw_i(1), C => SU3);
U4: MUX2 port map (A => NX1, B => NX0, S => sw_i(1), C => SU4);
U5: MUX2 port map (A => sw_i(2), B => SU3, S => sw_i(2), C => SU5);
U6: MUX2 port map (A => SU4, B => NX2, S => sw_i(2), C => SU6);
U7: MUX2 port map (A => SU5, B => SU6, S => sw_i(3), C => SU7);

led_o(0) <= '0';
led_o(1) <= SU7;
led_o(3) <= SU7;

end Structure;
