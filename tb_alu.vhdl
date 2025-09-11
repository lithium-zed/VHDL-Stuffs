library ieee;
use ieee.std_logic_1164.all;

entity tb_alu is
end tb_alu;


architecture rtl of tb_alu is
    component alu is
        port(
        opcode : in std_logic_vector(3 downto 0);      -- 4-bit opcode input
        operand_1 : in std_logic_vector(7 downto 0);   -- 8-bit first operand input
        operand_2 : in std_logic_vector(7 downto 0);   -- 8-bit second operand input
        operand_3 : in std_logic_vector(7 downto 0);   -- 8-bit third operand input (for 3-operand ops)
        result : out std_logic_vector(7 downto 0)
        );
    end component;

    signal tb_opcode : std_logic_vector(3 downto 0);      -- 4-bit opcode input
    signal tb_operand_1 :  std_logic_vector(7 downto 0);   -- 8-bit first operand input
    signal tb_operand_2 :  std_logic_vector(7 downto 0);   -- 8-bit second operand input
    signal tb_operand_3 :  std_logic_vector(7 downto 0);   -- 8-bit third operand input (for 3-operand ops)
    signal tb_result :  std_logic_vector(7 downto 0);

begin 
        alu_module : alu port map (tb_opcode, tb_operand_1, tb_operand_2, tb_operand_3, tb_result);

    process
        begin
        tb_opcode <= "0000";
        tb_operand_1 <= "00111010";
        tb_operand_2 <= "10111001";
        wait for 10 ms;
            
        tb_opcode <= "1000";
        
        wait for 10 ms;
    
        tb_opcode <= "1001";
        
        wait for 10 ms;

        tb_opcode <= "1010";
        
        wait for 10 ms;
        wait;
    
    end process;

end rtl;