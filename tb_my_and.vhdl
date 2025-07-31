library ieee;
use ieee.std_logic_1164.all;

entity tb_my_and is
    end tb_my_and;


architecture rtl of tb_my_and is
    component my_and is
        port(
            x : in std_logic;
            y : in std_logic;
            z : out std_logic
        );
    end component;

    signal tb_x : std_logic;
    signal tb_y : std_logic;
    signal tb_z : std_logic;

begin
    my_and_module : my_and port map(tb_x, tb_y, tb_z);

    process
    begin
        tb_x <= '0';
        tb_y <= '0';
        wait for 10 ms;

        tb_x <= '1';
        tb_y <= '0';
        wait for 10 ms;

        tb_x <= '0';
        tb_y <= '1';
        wait for 10 ms;
       
        tb_x <= '1';
        tb_y <= '1';
        wait for 10 ms;

        wait;
    end process;
end rtl;