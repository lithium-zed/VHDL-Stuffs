library ieee;
use ieee.std_logic_1164.all;

entity tb_half_adder is
end tb_half_adder;

architecture test of tb_half_adder is
    component half_adder
     port(
        x,y : in std_logic;
        c,s : out std_logic
    );
    end component;

    signal tb_x, tb_y : std_logic;
    signal tb_c, tb_s : std_logic;
begin
    half_adder_module : half_adder port map (
        tb_x,
        tb_y,
        tb_c,
        tb_s
    );
    process
        begin
            tb_x <= '0';
            tb_y <= '0';
            wait for 10 ns;
            tb_x <= '0';
            tb_y <= '1';
            wait for 10 ns;
            tb_x <= '1';
            tb_y <= '0';
            wait for 10 ns;
            tb_x <= '1';
            tb_y <= '1';
            wait for 10 ns;
            wait;
        end process;

end test;
