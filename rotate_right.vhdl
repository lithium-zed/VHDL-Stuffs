library IEEE;
use IEEE.std_logic_1164.all;

entity rotate_right is
    port (
      operand_1: in std_logic_vector(7 downto 0);
      result  : out std_logic_vector(7 downto 0)
    );
end entity rotate_right;

architecture rtl of rotate_right is
begin
    process(operand_1)
    begin
        result <= operand_1(0) & operand_1(7 downto 1);  -- Rotate right by 1 bit
    end process;

end architecture rtl;
