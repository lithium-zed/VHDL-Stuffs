library IEEE;
use IEEE.std_logic_1164.all;

entity tb_full_adder is
end tb_full_adder;

architecture behavior of tb_full_adder is
    component full_adder
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
    tb_full_adder_module : full_adder port map (tb_x, tb_y, tb_z, tb_c, tb_s);
    process
    begin
        tb_x <= "00000000"; tb_y <= "00000000"; tb_z <= "00000000";
        wait for 10 ms;
        tb_x <= "00101100"; tb_y <= "10010011"; tb_z <= "01010111";
        wait for 10 ms;
        tb_x <= "11111111"; tb_y <= "11111111"; tb_z <= "11111111";
        wait for 10 ms;
        wait;
        end process;
end behavior;
