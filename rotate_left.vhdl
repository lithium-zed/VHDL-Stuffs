library IEEE;
use IEEE.std_logic_1164.all;

entity rotate_left is
    port (
      operand_1: in std_logic_vector(7 downto 0);
      result  : out std_logic_vector(7 downto 0)
    );
end entity rotate_left;

architecture rtl of rotate_left is
begin 
    process(operand_1)
    begin
        result <= operand_1(6 downto 0) & operand_1(7);  -- Rotate left by 1 bit
    end process;

end architecture rtl;
