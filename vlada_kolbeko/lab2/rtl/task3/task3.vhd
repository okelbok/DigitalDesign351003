library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIN_CODE_CONV_D is
    port (
        sw_i    : in    std_logic_vector(15 downto 0);
        led_o   : out   std_logic_vector(15 downto 0)
    );
end MIN_CODE_CONV_D;

architecture Structural of MIN_CODE_CONV_D is
    signal sX3_0, sX3_1, sX3_2                      :   std_logic;
    signal sX4_0, sX4_1, sX4_2                      :   std_logic;
    signal snX3_0, snX3_1, snX4_0, snX4_1           :   std_logic;
    signal sY1_0, sY1_1, sY2_0, sY2_1, sY3_0, sY3_1 :   std_logic;
    
    component INV_D is
        generic (
            IS_DELAYED  : boolean   := true;
            DELAY       : time      := 2 ns
        );
        port (
            X   : in    std_logic;
            Y   : out   std_logic
        );
    end component;
    
    component AND2_D is
        generic (
            IS_DELAYED  : boolean   := true;
            DELAY       : time      := 5 ns
        );
        port (
            X1, X2  : in    std_logic;
            Y       : out   std_logic
        );
    end component;
    
    component INTCON_D is
        generic (
            DELAY       : time  := 10 ns
        );
        port (
            X   : in    std_logic;
            Y   : out   std_logic
        );
    end component;
begin
    led_o(15 downto 3) <= (others => '0');
    
    INTCON_sX3_0: INTCON_D
    generic map (
        DELAY => 12 ns
    )
    port map (
        X => sw_i(2),
        Y => sX3_0
    );
    
    INTCON_sX3_1: INTCON_D
    generic map (
        DELAY => 15 ns
    )
    port map (
        X => sw_i(2),
        Y => sX3_1
    );
    
    INTCON_sX3_2: INTCON_D
    generic map (
        DELAY => 20 ns
    )
    port map (
        X => sw_i(2),
        Y => sX3_2
    );
     
    INTCON_sX4_0: INTCON_D
    generic map (
        DELAY => 13 ns
    )
    port map (
        X => sw_i(3),
        Y => sX4_0
    );
            
    INTCON_sX4_1: INTCON_D
    generic map (
        DELAY => 16 ns
    )
    port map (
        X => sw_i(3),
        Y => sX4_1
    );
            
    INTCON_sX4_2: INTCON_D
    generic map (
        DELAY => 21 ns
    )
    port map (
        X => sw_i(3),
        Y => sX4_2
    );           
    
    INV_D_0: INV_D port map (
        X => sX3_0,
        Y => snX3_0
    );
    
    INV_D_1: INV_D port map (
        X => sX4_0,
        Y => snX4_0
    );
    
    INTCON_snX3: INTCON_D 
    generic map (
        DELAY => 11 ns
    )
    port map (
        X => snX3_0,
        Y => snX3_1
    );
    
    INTCON_snX4: INTCON_D port map (
        X => snX4_0,
        Y => snX4_1
    );
    
    AND2_D_0: AND2_D port map (
        X1 => sX3_1,
        X2 => snX4_1,
        Y => sY1_0
    );
    
    AND2_D_1: AND2_D port map (
        X1 => snX3_1,
        X2 => sX4_1,
        Y => sY2_0
    );
        
    AND2_D_2: AND2_D port map (
        X1 => sX3_2,
        X2 => sX4_2,
        Y => sY3_0
    );
    
    INTCON_sY1: INTCON_D port map (
        X => sY1_0,
        Y => sY1_1
    );
    
    INTCON_sY2: INTCON_D port map (
        X => sY2_0,
        Y => sY2_1
    );
    
    INTCON_sY3: INTCON_D port map (
        X => sY3_0,
        Y => sY3_1
    );
    
    led_o(0) <= sY1_1;
    led_o(1) <= sY2_1;
    led_o(2) <= sY3_1;
end Structural;