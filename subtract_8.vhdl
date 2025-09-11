library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtract_8 is
    port(
        x,y,z : in std_logic_vector(7 downto 0);
        c : out std_logic;
        s : out std_logic_vector(7 downto 0)
    );
    end subtract_8;

architecture rtl of subtract_8 is
    component subtract
      port(
        x,y : in std_logic_vector(7 downto 0);
        c : out std_logic;
        s : out std_logic_vector(7 downto 0)
    );
    end component;

    signal s1 : std_logic_vector(7 downto 0);
    signal c1, c2 : std_logic;

    begin
        subtract_1 : subtract port map (x,y,c1,s1);
        subtract_2 : subtract port map (s1,z,c2,s);
        c <= c1 or c2;
    end rtl;