library IEEE;
use ieee.std_logic_1164.all;

entity bistable_ctrl is
    port(
        sw_i  : in  std_logic_vector(2 downto 0);  -- sw_i(0)=d, sw_i(1)=wr, sw_i(2)=rd
        led_o : out std_logic_vector(1 downto 0)   -- led_o(0)=Q, led_o(1)=not_Q
    );
end bistable_ctrl;

architecture rtl of bistable_ctrl is

signal Q : std_logic := '0';
signal not_Q : std_logic := '1';

signal set_sig   : std_logic;
signal reset_sig : std_logic;

attribute KEEP : string;
attribute KEEP of Q : signal is "TRUE";
attribute KEEP of not_Q : signal is "TRUE";

begin

    set_sig   <= sw_i(1) and sw_i(0);          -- wr and d
    reset_sig <= sw_i(1) and (not sw_i(0));    -- wr and not d
    
    Q     <= not (not_Q or reset_sig);
    not_Q <= not (Q or set_sig);
    
    led_o(0) <= Q     when sw_i(2)='1' else '0';
    led_o(1) <= not_Q when sw_i(2)='1' else '0';

end rtl;