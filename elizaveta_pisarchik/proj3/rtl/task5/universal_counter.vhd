library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity universal_counter is
    generic ( N : integer range 1 to 64 := 8 );
    port (
        CLK  : in std_logic;
        CLR  : in std_logic;
        EN   : in std_logic;
        MODE : in std_logic_vector (1 downto 0);
        LOAD : in std_logic;
        Din  : in std_logic_vector (N-1 downto 0);
        Dout : out std_logic_vector (N-1 downto 0)
    );
end universal_counter;

architecture rtl of universal_counter is
    signal cur_state : std_logic_vector(N-1 downto 0) := (0 => '1', others => '0');
begin
    P0: process(CLK, CLR)
    begin
        if CLR = '1' then
            case MODE is
                when "00" => cur_state <= (0 => '1', others => '0'); 
                when "01" => cur_state <= (0 => '0', others => '1'); 
                when "10" => cur_state <= Din;                  
                when others => cur_state <= (others => '0');
            end case;
        elsif rising_edge(CLK) then
            if EN = '1' then
                if LOAD = '1' then
                    cur_state <= Din;
                else
                    cur_state <= cur_state(N-2 downto 0) & cur_state(N-1);
                end if;
            end if;
        end if;
    end process;
    
    Dout <= cur_state;
end rtl;