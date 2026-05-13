library ieee;
use ieee.std_logic_1164.all;

entity alu_unit is
    port(
        sw  : in  std_logic_vector(15 downto 0);
        led : out std_logic_vector(5 downto 0)
    );
end alu_unit;

architecture behavioral of alu_unit is

    signal X, Y : std_logic_vector(5 downto 0);
    signal result : std_logic_vector(5 downto 0);

begin

    X <= sw(15 downto 10);
    Y <= sw(9 downto 4);

    process(X, Y, sw)
        variable tmp_add : std_logic_vector(5 downto 0);
        variable carry   : std_logic;
        variable tmp_rot : std_logic_vector(5 downto 0);
    begin
        carry := '0';
        for i in 0 to 5 loop
            tmp_add(i) := X(i) xor Y(i) xor carry;
            carry := (X(i) and Y(i)) or (X(i) and carry) or (Y(i) and carry);
        end loop;

        tmp_rot := X(3 downto 0) & X(5 downto 4);

        case sw(3 downto 0) is
            when "0001" =>
                result <= tmp_add;
            when "0010" =>
                result <= not (X and Y);
            when "0100" =>
                result <= tmp_rot;
            when "1000" =>
                result <= X xor Y;
            when others =>
                result <= (others => '0');
        end case;
    end process;

    led <= result;

end behavioral;
