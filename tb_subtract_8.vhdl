library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_subtract_8 is
    end tb_subtract_8;

architecture behavioral of tb_subtract_8 is
    component subtract_8 is
        port(
            x,y,z : in std_logic_vector(7 downto 0);
            c : out std_logic;
            s : out std_logic_vector(7 downto 0)
        );
    end component;

    signal tb_x, tb_y, tb_z : std_logic_vector(7 downto 0);
    signal tb_c : std_logic;
    signal tb_s : std_logic_vector(7 downto 0);

begin
    subtract_8_module: subtract_8 port map (tb_x, tb_y, tb_z, tb_c, tb_s);
    process
    begin
        tb_x <= "00000000"; tb_y <= "00000000"; tb_z <= "00000000";
        wait for 10 ms;
        tb_x <= "00011011"; tb_y <= "00000111"; tb_z <= "00000000";
        wait for 10 ms;
        tb_x <= "11111111"; tb_y <= "11111111"; tb_z <= "00000000";
        wait for 10 ms;
        wait;
    end process;
    end behavioral;