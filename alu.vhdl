library ieee;
use ieee.std_logic_1164.all;

entity alu is
    port(
        opcode : in std_logic_vector(3 downto 0);      -- 4-bit opcode input
        operand_1 : in std_logic_vector(7 downto 0);   -- 8-bit first operand input
        operand_2 : in std_logic_vector(7 downto 0);   -- 8-bit second operand input
        result : out std_logic_vector(7 downto 0)     -- 8
    ); 
end alu;

architecture rtl of alu is
    component shift_left is
        port (
      operand_1: in std_logic_vector(7 downto 0);
      result  : out std_logic_vector(7 downto 0)
    );
    end component;
    component shift_right is
        port (
      operand_1: in std_logic_vector(7 downto 0);
      result  : out std_logic_vector(7 downto 0)
    );
    end component;
    component rotate_left is
        port (
      operand_1: in std_logic_vector(7 downto 0);
      result  : out std_logic_vector(7 downto 0)
    );
    end component;
    component rotate_right is
        port (
      operand_1: in std_logic_vector(7 downto 0);
      result  : out std_logic_vector(7 downto 0)
    );
    end component;

    signal resultSL : std_logic_vector(7 downto 0);
    signal resultSR : std_logic_vector(7 downto 0);
    signal resultRL : std_logic_vector(7 downto 0);
    signal resultRR : std_logic_vector(7 downto 0);
begin
        shift_left_module : shift_left port map (operand_1, resultSL);
        shift_right_module : shift_right port map (operand_1, resultSR);
        rotate_left_module : rotate_left port map (operand_1, resultRL);
        rotate_right_module : rotate_right port map (operand_1, resultRR);

    result <= operand_1 and operand_2 when opcode = "0000" else
        operand_1 or operand_2 when opcode = "0001" else
        not(operand_1) when opcode = "0010" else
        not(operand_2) when opcode = "0011" else
        resultSL when opcode = "0100" else
        resultSR when opcode = "0101" else
        resultRL when opcode = "0110" else
        resultRR when opcode = "0111" else
        (others => 'Z');
end rtl;