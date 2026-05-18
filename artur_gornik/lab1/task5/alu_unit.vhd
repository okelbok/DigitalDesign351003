library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_unit is
  Port (
    sw_i: in std_logic_vector(15 downto 0);
    led_o: out std_logic_vector(5 downto 0)
  );
end alu_unit;

architecture rtl of alu_unit is
    alias sw_i_op : std_logic_vector is sw_i(3 downto 0);
    alias sw_i1   : std_logic_vector is sw_i(9 downto 4);
    alias sw_i2   : std_logic_vector is sw_i(15 downto 10);
begin
    process(sw_i_op, sw_i1, sw_i2)
    begin 
        case sw_i_op is
            when "0001" => led_o <= sw_i1 nor sw_i2;
            when "0010" => led_o <= std_logic_vector(shift_right(unsigned(sw_i1), 3));
            when "0100" => led_o <= std_logic_vector(unsigned(sw_i1) - unsigned(sw_i2));
            when "1000" => led_o <= sw_i1 and sw_i2; 
            when others => led_o <= "000000";
        end case;
    end process;
end rtl;
