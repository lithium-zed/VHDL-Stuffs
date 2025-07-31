library ieee;
use ieee.std_logic_1164.all;

entity tb_decoder_alu is
end tb_decoder_alu;

architecture rtl of tb_decoder_alu is
    component instruction_decoder is
        port(
            instruction : in std_logic_vector(19 downto 0); -- 20-bit instruction input
            opcode : out std_logic_vector(3 downto 0);      -- 4-bit opcode output
            operand_1 : out std_logic_vector(7 downto 0);   -- 8-bit first operand output
            operand_2 : out std_logic_vector(7 downto 0)    -- 8-bit second operand output
        );
    end component;

    component alu is
        port(
        opcode : in std_logic_vector(3 downto 0);      -- 4-bit opcode input
        operand_1 : in std_logic_vector(7 downto 0);   -- 8-bit first operand input
        operand_2 : in std_logic_vector(7 downto 0);   -- 8-bit second operand input
        result : out std_logic_vector(7 downto 0)
        );
    end component;
    
    signal tb_instruction : std_logic_vector(19 downto 0);
    signal tb_opcode : std_logic_vector(3 downto 0);      -- 4-bit opcode input
    signal tb_operand_1 :  std_logic_vector(7 downto 0);   -- 8-bit first operand input
    signal tb_operand_2 :  std_logic_vector(7 downto 0);   -- 8-bit second operand input
    signal tb_result :  std_logic_vector(7 downto 0);

begin 
        instruction_decoder_module : instruction_decoder port map (tb_instruction, tb_opcode, tb_operand_1, tb_operand_2);
        alu_module : alu port map (tb_opcode, tb_operand_1, tb_operand_2, tb_result);

    process
        begin
        tb_opcode <= "0001";
        tb_operand_1 <= "00111010";
        tb_operand_2 <= "10111001";
        wait for 10 ms;
            
        tb_opcode <= "0000";
        
        wait for 10 ms;
    
        tb_opcode <= "0010";
        
        wait for 10 ms;

        tb_opcode <= "0011";
        
        wait for 10 ms;
        
        tb_opcode <= "0100";
        
        wait for 10 ms;
        
        tb_opcode <= "0101";
        
        wait for 10 ms;

        wait;
    
    end process;

end rtl;