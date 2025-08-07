library ieee;
use ieee.std_logic_1164.all;

entity comparator is
    port(
        A,B : in std_logic_vector (7 downto 0);
        LT, GT, EQ : out std_logic
    );
end comparator;

architecture rtl of comparator is
    begin
        LT <= '1' when A < B else '0';
        GT <= '1' when A > B else '0';
        EQ <= '1' when A = B else '0';
    end rtl;