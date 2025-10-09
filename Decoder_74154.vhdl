library ieee;
use ieee.std_logic_1164.all;

entity decoder_4to16 is
    port(
        D : in std_logic_vector(3 downto 0); -- D3 (MSB), D2, D1, D0
        Y : out std_logic_vector(15 downto 0)
    );
end decoder_4to16;

architecture rtl of decoder_4to16 is
    component decoder_74138
        port(
            A, B, C : in std_logic;
            G1, G2A, G2B : in std_logic; -- Enable inputs
            Y : out std_logic_vector(7 downto 0)
        );
    end component;

    signal Y_low, Y_high : std_logic_vector(7 downto 0);
    signal enable_low, enable_high : std_logic;

begin
    enable_low  <= not D(3);
    enable_high <= D(3);

    -- Lower half: D3 = 0 enables this decoder
    decoder_low: decoder_74138
        port map (
            A => D(2),
            B => D(1),
            C => D(0),
            G1 => enable_low,   -- Enable when D3 = 0
            G2A => '0',         -- Active low
            G2B => '0',         -- Active low
            Y => Y_low
        );

    -- Upper half: D3 = 1 enables this decoder
    decoder_high: decoder_74138
        port map (
            A => D(2),
            B => D(1),
            C => D(0),
            G1 => enable_high,  -- Enable when D3 = 1
            G2A => '0',         -- Active low
            G2B => '0',         -- Active low
            Y => Y_high
        );

    -- Combine outputs
    Y(7 downto 0)   <= Y_low;
    Y(15 downto 8)  <= Y_high;
end rtl;