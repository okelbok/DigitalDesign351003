library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_unit is
    port(
        led_o: out std_logic_vector(5 downto 0);
        sw_i: in std_logic_vector(15 downto 0)
    );
end alu_unit;

architecture behaviour of alu_unit is
begin
    process(sw_i)
    variable sum: unsigned(6 downto 0);
    begin
        case sw_i(3 downto 0) is
            when "0001" => led_o <= sw_i(13 downto 10) & sw_i(15 downto 14);
            when "0010" => led_o <= sw_i(15 downto 10) and sw_i(9 downto 4);
            when "0100" => led_o <= sw_i(15 downto 10) nand sw_i(9 downto 4);
            when "1000" => 
                sum := resize(unsigned(sw_i(15 downto 10)), 7) + resize(unsigned(sw_i(9 downto 4)), 7);
                led_o <= std_logic_vector(sum(5 downto 0));
            when others => led_o <= "000000";
        end case;
    end process;
end behaviour;