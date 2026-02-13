library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testTop is
  port (
    sw : in  std_logic_vector(15 downto 0);
    led_o : out std_logic_vector(15 downto 0)
  );
end testTop;

architecture rtl of testTop is
begin
  process(sw)
    variable op1, op2 : unsigned(5 downto 0);
    variable temp : unsigned(6 downto 0);
  begin
    op1 := unsigned(sw(15 downto 10));
    op2 := unsigned(sw(9 downto 4));
    
    case sw(3 downto 0) is
      when "0001" =>  -- NAND
        led_o(5 downto 0) <= std_logic_vector(not (op1 and op2));
        
      when "0010" =>  -- ADD
        temp := resize(op1, 7) + resize(op2, 7);
        led_o(5 downto 0) <= std_logic_vector(temp(5 downto 0));
        
      when "0100" =>  -- SHL2
        led_o(5 downto 0) <= std_logic_vector(op1(3 downto 0) & "00");
        
      when "1000" =>  -- XOR
        led_o(5 downto 0) <= std_logic_vector(op1 xor op2);
        
      when others =>
        led_o(5 downto 0) <= (others => '0');
    end case;
    
    led_o(15 downto 6) <= (others => '0');
  end process;
end rtl;