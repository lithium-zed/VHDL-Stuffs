library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add_8 is
    port(
        x,y,z : in std_logic_vector(7 downto 0);
        c : out std_logic;
        s : out std_logic_vector(7 downto 0)
    );
    end add_8;


architecture rtl of add_8 is
    component half_adder
      port(
        x,y : in std_logic_vector(7 downto 0);
        c : out std_logic;
        s : out std_logic_vector(7 downto 0)
    );
    end component;

    signal s1 : std_logic_vector(7 downto 0);
    signal c1, c2 : std_logic;

begin
    half_adder_1 : half_adder port map (x,y,c1,s1);
    half_adder_2 : half_adder port map (s1,z,c2,s);
    c <= c1 or c2;
    end rtl;    