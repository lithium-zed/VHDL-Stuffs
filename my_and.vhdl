library ieee;
use ieee.std_logic_1164.all;

entity my_and is
    port(
        x : in std_logic;
        y : in std_logic;
        z : out std_logic
    );
end my_and;

architecture rtl of my_and is
    begin
        z <= x and y;
end rtl;

