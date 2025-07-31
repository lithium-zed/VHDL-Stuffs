-- instruction_decoder: Decodes a 20-bit instruction into opcode and operands
library ieee;
use ieee.std_logic_1164.all;

-- Entity declaration for instruction_decoder
entity instruction_decoder is
    port(
        instruction : in std_logic_vector(19 downto 0); -- 20-bit instruction input
        opcode : out std_logic_vector(3 downto 0);      -- 4-bit opcode output
        operand_1 : out std_logic_vector(7 downto 0);   -- 8-bit first operand output
        operand_2 : out std_logic_vector(7 downto 0)    -- 8-bit second operand output
    );
end instruction_decoder;

-- Architecture: Slices the instruction into opcode and operands
architecture rtl of instruction_decoder is
    begin
        opcode <= instruction(19 downto 16);    -- Extract bits 19-16 as opcode
        operand_1 <= instruction(15 downto 8); -- Extract bits 15-8 as operand_1
        operand_2 <= instruction(7 downto 0);  -- Extract bits 7-0 as operand_2
    end rtl;