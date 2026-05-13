----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2026 02:01:15
-- Design Name: 
-- Module Name: UniversalShiftRegister - Behavioral
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

entity UniversalShiftRegister is
    generic (
        N : natural := 8
    );
    port(
        CLK  : in std_logic;
        CLR  : in std_logic;
        EN   : in std_logic;
        MODE : in std_logic_vector(1 downto 0);
        LOAD : in std_logic;
        Din  : in std_logic_vector(N - 1 downto 0);
        Dout : out std_logic_vector(N - 1 downto 0)
    );
end UniversalShiftRegister;

architecture Behavioral of UniversalShiftRegister is
    signal store : std_logic_vector(Dout'range);
begin
    Dout <= store;
    
    process(CLK, CLR)
    begin
        if CLR = '1' then
            store <= (others => '0');
        elsif rising_edge(CLK) and (EN = '1') then
            case MODE is
                -- shl
                when "00" =>
                    store <= store(store'high - 1 downto 0) & '0';
                -- shr
                when "01" =>
                    store <= '0' & store(store'high downto 1);
                -- parallel load
                when "10" =>
                    if LOAD = '1' then
                        store <= Din;
                    end if;
                when others =>
            end case;
        end if;
    end process;

end Behavioral;
