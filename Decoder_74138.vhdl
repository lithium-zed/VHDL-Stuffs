library ieee;
use ieee.std_logic_1164.all;

entity decoder_3to8 is
    port(
        G1 : in std_logic;   -- Active high enable
        G2A : in std_logic;  -- Active low enable
        G2B : in std_logic;  -- Active low enable
        A : in std_logic_vector(2 downto 0); -- A(2): MSB, A(1): middle, A(0): LSB
        Y : out std_logic_vector(7 downto 0)
    );
end decoder_3to8;

architecture rtl of decoder_3to8 is
    component decoder_74139
        port(
            G1 : in std_logic;
            A, B : in std_logic;
            Y0, Y1, Y2, Y3 : out std_logic
        );
    end component;

    signal Y_low : std_logic_vector(3 downto 0);
    signal Y_high : std_logic_vector(3 downto 0);

    signal enable_low, enable_high : std_logic;

begin
    -- Enable logic: only one decoder is enabled at a time
    enable_low  <= G1 and not G2A and not G2B and not A(2);
    enable_high <= G1 and not G2A and not G2B and A(2);

    -- Lower half decoder (A2 = 0)
    decoder_low: decoder_74139
        port map (
            G1 => enable_low,
            A => A(1),
            B => A(0),
            Y0 => Y_low(0),
            Y1 => Y_low(1),
            Y2 => Y_low(2),
            Y3 => Y_low(3)
        );

    -- Upper half decoder (A2 = 1)
    decoder_high: decoder_74139
        port map (
            G1 => enable_high,
            A => A(1),
            B => A(0),
            Y0 => Y_high(0),
            Y1 => Y_high(1),
            Y2 => Y_high(2),
            Y3 => Y_high(3)
        );

    -- Output logic: combine outputs
    Y(3 downto 0) <= Y_low;
    Y(7 downto 4) <= Y_high;
end rtl;
