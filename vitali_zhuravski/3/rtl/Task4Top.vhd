----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.04.2026 17:00:40
-- Design Name: 
-- Module Name: Task4Top - Behavioral
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

entity Task4Top is
    port(
        led_out : out std_logic_vector(15 downto 0);
        sw_in : in std_logic_vector(15 downto 0);
        clk : in std_logic
    );
end Task4Top;

architecture Behavioral of Task4Top is
    component FreqDivBehav is
        generic (
            K : natural := 10
        );
        port (
            CLK : in  std_logic;
            RST : in  std_logic;
            EN  : in  std_logic;
            Q   : out std_logic
        );
    end component;
begin
    led_out(15 downto 1) <= (others => '0');

    U0 : FreqDivBehav
    generic map(K => 50000000)
    port map(CLK => clk, RST => sw_in(0), EN => sw_in(1), Q => led_out(0));

end Behavioral;
