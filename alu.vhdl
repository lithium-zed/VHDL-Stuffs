library ieee;
use ieee.std_logic_1164.all;

entity alu is
    port(
        opcode : in std_logic_vector(3 downto 0);      -- 4-bit opcode input
        operand_1 : in std_logic_vector(7 downto 0);   -- 8-bit first operand input
        operand_2 : in std_logic_vector(7 downto 0);   -- 8-bit second operand input
        operand_3 : in std_logic_vector(7 downto 0);   -- 8-bit third operand input (for 3-operand ops)
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
    component add_8 is
        port(
            x,y,z : in std_logic_vector(7 downto 0);
            c : out std_logic;
            s : out std_logic_vector(7 downto 0)
        );
    end component;
    component subtract_8 is
        port(
            x,y,z : in std_logic_vector(7 downto 0);
            c : out std_logic;
            s : out std_logic_vector(7 downto 0)
        );
      end component;
    component swap is
        port(
            x : in std_logic_vector(7 downto 0);
            result : out std_logic_vector(7 downto 0)
        );
    end component;

    signal resultSL : std_logic_vector(7 downto 0);
    signal resultSR : std_logic_vector(7 downto 0);
    signal resultRL : std_logic_vector(7 downto 0);
    signal resultRR : std_logic_vector(7 downto 0);
    signal resultADD_8 : std_logic_vector(7 downto 0);
    signal resultSUB_8 : std_logic_vector(7 downto 0);
    signal cADD_8 : std_logic;
    signal cSUB_8 : std_logic;
    signal resultSWAP : std_logic_vector(7 downto 0);
    
begin
        shift_left_module : shift_left port map (operand_1, resultSL);
        shift_right_module : shift_right port map (operand_1, resultSR);
        rotate_left_module : rotate_left port map (operand_1, resultRL);
        rotate_right_module : rotate_right port map (operand_1, resultRR);
        add_8_module : add_8 port map (operand_1, operand_2, operand_3, cADD_8, resultADD_8);
        subtract_8_module : subtract_8 port map (operand_1, operand_2, operand_3, cSUB_8, resultSUB_8);
        swap_module : swap port map (operand_1, resultSWAP);

    result <= operand_1 and operand_2 when opcode = "0000" else
        operand_1 or operand_2 when opcode = "0001" else
        not(operand_1) when opcode = "0010" else
        not(operand_2) when opcode = "0011" else
        resultSL when opcode = "0100" else
        resultSR when opcode = "0101" else
        resultRL when opcode = "0110" else
        resultRR when opcode = "0111" else
        resultADD_8 when opcode = "1000" else
        resultSUB_8 when opcode = "1001" else
        resultSWAP when opcode = "1010" else
        (others => 'Z');
end rtl;