library IEEE;
use IEEE.std_logic_1164.all;

entity shift_right is
    port (
      operand_1: in std_logic_vector(7 downto 0);
      result  : out std_logic_vector(7 downto 0)
    );
end entity shift_right;

architecture rtl of shift_right is
begin 
    process(operand_1)
    begin
        result <= '0' & operand_1(7 downto 1);  -- Shift right by 1 bit
    end process;

end architecture rtl;