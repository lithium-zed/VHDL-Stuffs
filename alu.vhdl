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
begin
    result <= operand_1 and operand_2 when opcode = "0000" else
        operand_1 or operand_2 when opcode = "0001" else
        operand_1 xor operand_2 when opcode = "0010" else
        not(operand_1) when opcode = "0011" else
        not(operand_2) when opcode = "0100" else
        (others => 'Z');
end rtl;