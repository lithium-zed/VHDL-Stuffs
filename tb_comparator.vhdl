library ieee;
use ieee.std_logic_1164.all;

entity tb_comparator is
    end tb_comparator;

architecture rtl of tb_comparator is
    component comparator is
        port(
            A,B : in std_logic_vector (7 downto 0);
            LT, GT, EQ : out std_logic
    );
    end component;

    signal tb_A : std_logic_vector (7 downto 0);
    signal tb_B : std_logic_vector(7 downto 0);
    signal tb_LT : std_logic;
    signal tb_GT : std_logic;
    signal tb_EQ : std_logic;

begin
    comparator_module : comparator port map (tb_A,tb_B,tb_LT,tb_GT,tb_EQ);

    process
        begin
            tb_A <= "00000000";
            tb_B <= "00000000";
            wait for 10 ms;
            tb_A <= "00000001";
            tb_B <= "00000000";
            wait for 10 ms;
            tb_A <= "00000000";
            tb_B <= "00000001";
            wait for 10 ms;
            wait;
        end process;
end rtl;