library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtract is
    port(
        x,y : in std_logic_vector(7 downto 0);
        c : out std_logic;
        s : out std_logic_vector(7 downto 0)
    );
end subtract;

architecture rtl of subtract is
    signal temp_s : unsigned (8 downto 0);
    begin
        temp_s <= unsigned('0' & x) - unsigned('0' & y);
        s <= std_logic_vector(temp_s(7 downto 0));
        c <= temp_s(8);

end rtl;