-- Testbench for instruction_decoder: verifies opcode and operand extraction
library ieee;
use ieee.std_logic_1164.all;

-- Entity declaration for testbench (no ports)
entity tb_instruction_decoder is
end tb_instruction_decoder;

architecture rtl of tb_instruction_decoder is
    -- Component declaration for the unit under test
    component instruction_decoder is
        port(
            instruction : in std_logic_vector(19 downto 0); -- 20-bit instruction input
            opcode : out std_logic_vector(3 downto 0);      -- 4-bit opcode output
            operand_1 : out std_logic_vector(7 downto 0);   -- 8-bit first operand output
            operand_2 : out std_logic_vector(7 downto 0)    -- 8-bit second operand output
        );
    end component;

    -- Signals to connect to the instruction_decoder
    signal tb_instruction : std_logic_vector(19 downto 0); -- Test instruction signal
    signal opcode : std_logic_vector(3 downto 0);          -- Output opcode signal
    signal operand_1 : std_logic_vector(7 downto 0);       -- Output operand_1 signal
    signal operand_2 : std_logic_vector(7 downto 0);       -- Output operand_2 signal


begin
    -- Instantiate the instruction_decoder and connect signals
    instruction_decoder_module: instruction_decoder
        port map(
            instruction => tb_instruction,
            opcode => opcode,
            operand_1 => operand_1,
            operand_2 => operand_2
        );
    -- Test process: apply test vector and wait
    process
    begin
        tb_instruction <= "00111111001110101011"; -- Apply test instruction (hex 3F3AB)
        wait for 10 ms; -- Wait for 10 ms to observe the outputs
        
        wait; -- End simulation
    end process;
end rtl;
