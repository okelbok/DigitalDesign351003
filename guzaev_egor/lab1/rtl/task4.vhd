library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity task4 is
    Port (
        sw  : in  STD_LOGIC_VECTOR (3 downto 0);
        led : out STD_LOGIC_VECTOR (15 downto 0)
    );
end task4;

architecture Structural of task4 is
    signal nA, nB, nC : std_logic;
    signal t1, t2, t3, t4, t5 : std_logic;
    signal or4_temp : std_logic;  
    signal f_out : std_logic;     
begin 
    INV_A: INV port map (I => sw(3), O => nA);
    INV_B: INV port map (I => sw(2), O => nB);
    INV_C: INV port map (I => sw(1), O => nC);

    AND_t1: AND2 port map (I0 => nB, I1 => sw(1), O => t1);
    AND_t2: AND3 port map (I0 => sw(3), I1 => nB, I2 => sw(0), O => t2);
    AND_t3: AND3 port map (I0 => sw(3), I1 => nC, I2 => sw(0), O => t3);
    AND_t4: AND4 port map (I0 => nA, I1 => sw(2), I2 => nC, I3 => sw(0), O => t4);
    AND_t5: AND4 port map (I0 => sw(3), I1 => sw(2), I2 => sw(1), I3 => sw(0), O => t5);

    OR4_STEP1: OR4 port map (I0 => t1, I1 => t2, I2 => t3, I3 => t4, O => or4_temp);
    
    LUT2_FINAL: LUT2
        generic map (INIT => "1110")
        port map (I0 => or4_temp, I1 => t5, O => f_out);
    
    led(0) <= f_out;
    led(15 downto 1) <= (others => '0');
end Structural;
