library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
    port(
        x,y : in std_logic;
        c,s : out std_logic
    );
end half_adder;

architecture rtl of half_adder is
    begin
        c <= x and y;
        s <= x xor y;
end rtl;

