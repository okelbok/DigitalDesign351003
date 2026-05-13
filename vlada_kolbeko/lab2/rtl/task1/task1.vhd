library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIN_CODE_CONV is
    port (
        sw_i    : in    std_logic_vector(15 downto 0);
        led_o   : out   std_logic_vector(15 downto 0)
    );
end MIN_CODE_CONV;

architecture Structural of MIN_CODE_CONV is
    signal nX3, nX4 :   std_logic;
    
    component INV is
        port (
            X   : in    std_logic;
            Y   : out   std_logic
        );
    end component;
    
    component AND2 is
        port (
            X1, X2  : in    std_logic;
            Y       : out   std_logic
        );
    end component;
begin
    led_o(15 downto 3) <= (others => '0');
    
    INV0: INV port map (
        X => sw_i(2),
        Y => nX3
    );
    
    INV1: INV port map (
        X => sw_i(3),
        Y => nX4
    );
    
    AND2_0: AND2 port map (
        X1 => sw_i(2),
        X2 => nX4,
        Y => led_o(0)
    );
    
    AND2_1: AND2 port map (
        X1 => nX3,
        X2 => sw_i(3),
        Y => led_o(1)
    );
        
    AND2_2: AND2 port map (
        X1 => sw_i(2),
        X2 => sw_i(3),
        Y => led_o(2)
    );
end Structural;