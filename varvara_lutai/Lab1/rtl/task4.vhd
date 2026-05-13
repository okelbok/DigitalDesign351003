----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.02.2026 22:02:11
-- Design Name: 
-- Module Name: task4 - Structure
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


library IEEE; --, UNISIM
use IEEE.STD_LOGIC_1164.ALL; --, UNISIM.vcomponents.all

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity task4 is
port (
sw_i  :in std_logic_vector (3 downto 0);
led_o   :out std_logic_vector (0 to 0)
);
end task4;


architecture Structure of task4 is
signal NX1, NX2, NX3, NX0, SU5, SU6, SU7, SU8, SU9, SU10: std_logic;
component INV port (A: in std_logic; B: out std_logic);
end component;
component AND3 port (A, B, C: in std_logic; D: out std_logic);
end component;
component OR6 port (A, B, C, D, E, F: in std_logic; G: out std_logic);
end component;
begin

U1: INV port map(A => sw_i(0), B => NX0);
U2: INV port map(A => sw_i(1), B => NX1);
U3: INV port map(A => sw_i(2), B => NX2);
U4: INV port map(A => sw_i(3), B => NX3);

U5: AND3 port map(A => sw_i(0), B => NX1, C => NX3, D => SU5);
U6: AND3 port map(A => sw_i(0), B => NX2, C => NX3, D => SU6);
U7: AND3 port map(A => sw_i(1), B => sw_i(2), C => sw_i(3), D => SU7);
U8: AND3 port map(A => NX0, B => sw_i(1), C => sw_i(2), D => SU8);
U9: AND3 port map(A => sw_i(0), B => NX1, C => NX2, D => SU9);
U10: AND3 port map(A => NX0, B => NX2, C => sw_i(3), D => SU10);

U11: OR6 port map(A => SU5, B => SU6, C => SU7, D => SU8, E => SU9, F => SU10, G => led_o(0));
end Structure;
