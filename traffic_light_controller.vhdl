library ieee;
use ieee.std_logic_1164.all;

entity traffic_light_controller is
    port(
        x : in std_logic_vector (2 downto 0);
        gyr : out std_logic_vector (5 downto 0)
    );
    end traffic_light_controller;

architecture rtl of traffic_light_controller is
    begin
        with x select
            gyr <= "100001" when "000",
                "010001" when "001",
                "001100" when "010",
                "001010" when "011",
                "001100" when "100",
                "XXXXXX" when others;
    end rtl;