library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIN_CODE_CONV_D_TB is
end MIN_CODE_CONV_D_TB;

architecture Behavioral of MIN_CODE_CONV_D_TB is
    constant T          :   time := 100 ns;
    
    signal sw_i, led_o  :   std_logic_vector(15 downto 0);
    signal X, Y         :   std_logic_vector(3 downto 0);
    
    component MIN_CODE_CONV_D is
        port (
            sw_i    : in    std_logic_vector(15 downto 0);
            led_o   : out   std_logic_vector(15 downto 0)
        );
    end component;
begin
    UUT: MIN_CODE_CONV_D port map (
        sw_i => sw_i,
        led_o => led_o
    );
    
    sw_i <= (15 downto 4 => '0') & X;
    Y <= led_o(3 downto 0);
    
    Sim: process
    begin
        report "Simulation started" severity note;

        X <= "0010"; wait for T;
        assert (Y = "0000") 
            report "Code conversion for 0010 is incorrect" 
            severity error;
        
        X <= "0101"; wait for T;
        assert (Y = "0001")
            report "Code conversion for 0101 is incorrect"
            severity error;
            
        X <= "1001"; wait for T;
        assert (Y = "0010")
            report "Code conversion for 1001 is incorrect"
            severity error;
            
        X <= "1100"; wait for T;
        assert (Y = "0100")
            report "Code conversion for 1100 is incorrect"
            severity error;
            
        report "Simulation ended successfully" severity note;
    end process Sim;
end Behavioral;