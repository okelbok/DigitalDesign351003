library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity task6 is
  Port (
    sw_i: in std_logic_vector(3 downto 0);
    led_o: out std_logic_vector(3 downto 0)
    );
end task6;

architecture rtl of task6 is
begin
    process (sw_i)
    begin
        case sw_i is
            when "0000" => led_o <= "0001"; -- 0
            when "0001" => led_o <= "0010"; -- 1
            when "0010" => led_o <= "0100"; -- 2
            when "0011" => led_o <= "1000"; -- 3
            
            when "0100" => led_o <= "0001"; -- 4
            when "1000" => led_o <= "0010"; -- 5 
            when "1001" => led_o <= "0100"; -- 6
            when "1010" => led_o <= "1000"; -- 7
            
            when "1011" => led_o <= "0001"; -- 8
            when "1100" => led_o <= "0010"; -- 9
            
            -- запрещенные комбинаций 
            when others => led_o <= "0000";         
        end case;
    end process;
end rtl;
