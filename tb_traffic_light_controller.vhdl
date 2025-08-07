library ieee;
use ieee.std_logic_1164.all;

entity tb_traffic_light_controller is
    end tb_traffic_light_controller;

architecture rtl of tb_traffic_light_controller is
    component traffic_light_controller is
        port(
        x : in std_logic_vector (2 downto 0);
        gyr : out std_logic_vector (5 downto 0)
    );
    end component;

    signal tb_x : std_logic_vector(2 downto 0);
    signal tb_gyr : std_logic_vector (5 downto 0);

begin 
        traffic_light_controller_module : traffic_light_controller port map (tb_x,tb_gyr);

        process
            begin
                tb_x <= "000";
                wait for 10 ms;
                tb_x <= "001";
                wait for 10 ms;
                tb_x <= "010";
                wait for 10 ms;
                tb_x <= "011";
                wait for 10 ms;
                tb_x <= "100";
                wait for 10 ms;
                tb_x <= "101";
                wait for 10 ms;
                tb_x <= "110";
                wait for 10 ms;
                tb_x <= "111";
                wait for 10 ms;
            wait;
        end process;

end rtl;
