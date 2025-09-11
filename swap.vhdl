library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity swap is
    port(
        x : in std_logic_vector(7 downto 0);
        result : out std_logic_vector(7 downto 0)
    );
    end swap;

architecture rtl of swap is
    begin
       result <= x(3 downto 0) & x(7 downto 4);
    end rtl;