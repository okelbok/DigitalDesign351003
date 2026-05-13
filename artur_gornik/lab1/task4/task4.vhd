library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity task4 is
    port (
        sw_i: in STD_LOGIC_VECTOR(3 downto 0);
        led_o: out STD_LOGIC_VECTOR(0 downto 0)
    );
end task4;

architecture rtl of task4 is
    component inv2
        port (
            I: in std_logic;
            O: out std_logic
        );
    end component;

    component and2
        port (
            I0: in std_logic;
            I1: in std_logic;
            O:  out std_logic
        );
    end component;

    component or2
        port (
            I0: in std_logic; 
            I1: in std_logic;
            O:  out std_logic
        );
    end component;

    alias A: std_logic is sw_i(3);
    alias B: std_logic is sw_i(2);
    alias C: std_logic is sw_i(1);
    alias D: std_logic is sw_i(0);

    signal not_A, not_B, not_D: std_logic;
    signal cd_res: std_logic;
    signal not_b_or_cd_res: std_logic;
    signal term1: std_logic;
    signal a_not_d_res: std_logic;

begin
    U1: inv2 port map (I => A, O => not_A);
    U2: inv2 port map (I => B, O => not_B);
    U3: inv2 port map (I => D, O => not_D);
    
    U4: and2 port map(I0 => C, I1 => D, O => cd_res);     
    
    U5: or2 port map(I0 => not_B, I1 => cd_res, O => not_b_or_cd_res);
    
    U6: and2 port map(I0 => not_A, I1 => not_b_or_cd_res, O => term1);
    
    U7: and2 port map(I0 => A, I1 => not_D, O => a_not_d_res);
    
    U8: or2 port map(I0 => term1, I1 => a_not_d_res, O => led_o(0)); 
    
end rtl;