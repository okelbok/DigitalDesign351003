----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2026 11:55:18
-- Design Name: 
-- Module Name: PwmController - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PwmController is
    generic(
        CNT_WIDTH : natural := 8
    );
    port(
        CLK : in std_logic;
        CLR : in std_logic;
        EN : in std_logic;
        FILL : in std_logic_vector(CNT_WIDTH - 1 downto 0);
        Q : out std_logic
    );
end PwmController;

architecture Behavioral of PwmController is
    constant MAX_COUNTER : natural := 2 ** CNT_WIDTH - 1;

    signal output : std_logic;
    signal counter : natural;
begin
    Q <= output;
    
    process(CLK, CLR)
        variable cur_counter : natural;
    begin
        cur_counter := counter;
        if CLR = '1' then
            cur_counter := 0;
        elsif rising_edge(CLK) and EN = '1' then
            if cur_counter = MAX_COUNTER then
                cur_counter := 0;
            else
                cur_counter := cur_counter + 1;
            end if;
        end if;
        if CLR = '1' or rising_edge(CLK) then
            if to_integer(unsigned(FILL)) <= cur_counter then
                output <= '0';
            else
                output <= '1';
            end if;
        end if;
        counter <= cur_counter;
    end process;
end Behavioral;
