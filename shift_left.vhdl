library IEEE;
use IEEE.std_logic_1164.all;


entity shift_left is
    port (
      operand_1: in std_logic_vector(7 downto 0);
      result  : out std_logic_vector(7 downto 0)
    );
end entity shift_left;

architecture rtl of shift_left is
begin
    process(operand_1)
    begin
        result <= operand_1(6 downto 0) & '0';  -- Shift left by 1 bit
    end process;

end architecture rtl;
