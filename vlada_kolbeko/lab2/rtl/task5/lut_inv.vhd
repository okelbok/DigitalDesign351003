library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity LUT_INV is
    port (  
        X   : in    std_logic;
        Y   : out   std_logic
    );
end LUT_INV;

architecture Structural of LUT_INV is
    constant INV_INIT   :   bit_vector(0 to 1) := "01";
begin
    LUT_INV_0: LUT1
    generic map (
        INIT => INV_INIT
    )
    port map (
        I0 => X,
        O => Y
    );
end Structural;