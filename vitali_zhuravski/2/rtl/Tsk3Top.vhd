library ieee;
use ieee.std_logic_1164.all;

library UNISIM;
use UNISIM.VComponents.all;

library work;
use work.delayed_components.all;

-- 3: nAnBCD = (A nor B)CD
-- 2: nAnBCnD = (A nor B)CnD = (A nor B)(C xor D)C
-- 1: nAnBnCD = (A nor B)nCD = (A nor B)(C xor D)D
-- 0: nAnBnCnD = (A nor B)nCnD = (A nor B)(C nor D)

entity tsk3_top is
    port (
        led_out : out std_logic_vector(15 downto 0);
        sw_in : in std_logic_vector(15 downto 0)
    );
end tsk3_top;

architecture structure of tsk3_top is
    signal A : std_logic;
    signal B : std_logic;
    signal C : std_logic;
    signal D : std_logic;
    
    signal nCr : std_logic;
    signal nDr : std_logic;
    signal nC : std_logic;
    signal nD : std_logic;
    
    signal nAnBr : std_logic;
    signal nAnBCr : std_logic;
    signal nAnBnCr : std_logic;
    signal nAnB : std_logic;
    signal nAnBC : std_logic;
    signal nAnBnC : std_logic;
    
    signal led_out_r : std_logic_vector(3 downto 0);
begin
    led_out(15 downto 4) <= "000000000000";
    
    W1 : DEL_WIRE port map (I => sw_in(3), O => A);
    W2 : DEL_WIRE port map (I => sw_in(2), O => B);
    W3 : DEL_WIRE port map (I => sw_in(1), O => C);
    W4 : DEL_WIRE port map (I => sw_in(0), O => D);
    
    U1 : DEL_INV port map (I => C, O => nCr);
    U2 : DEL_INV port map (I => D, O => nDr);
    
    W5 : DEL_WIRE port map (I => nCr, O => nC);
    W6 : DEL_WIRE port map (I => nDr, O => nD);
    
    U3 : DEL_NOR2 port map (I0 => A, I1 => B, O => nAnBr);
    U4 : DEL_AND2 port map (I0 => nAnB, I1 => C, O => nAnBCr);
    U5 : DEL_AND2 port map (I0 => nAnB, I1 => nC, O => nAnBnCr);
    
    W7 : DEL_WIRE port map (I => nAnBr, O => nAnB);
    W8 : DEL_WIRE port map (I => nAnBCr, O => nAnBC);
    W9 : DEL_WIRE port map (I => nAnBnCr, O => nAnBnC);
    
    U6 : DEL_AND2 port map (I0 => nAnBC, I1 => D, O => led_out_r(3));
    U7 : DEL_AND2 port map (I0 => nAnBC, I1 => nD, O => led_out_r(2));
    U8 : DEL_AND2 port map (I0 => nAnBnC, I1 => D, O => led_out_r(1));
    U9 : DEL_AND2 port map (I0 => nAnBnC, I1 => nD, O => led_out_r(0));
    
    W10 : for I in 0 to 3 generate
        W11 : DEL_WIRE port map (I => led_out_r(I), O => led_out(I));
    end generate;
end structure;