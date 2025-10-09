library ieee;
use ieee.std_logic_1164.all;

entity tb_decoder_74138 is
end tb_decoder_74138;

architecture rtl of tb_decoder_74138 is
    component decoder_74138
        port(
            A, B, C : in std_logic;
            G1, G2A, G2B : in std_logic; -- Enable inputs
            Y : out std_logic_vector(7 downto 0)
        );
    end component;

    signal A, B, C : std_logic := '0';
    signal G1 : std_logic := '0';
    signal G2A : std_logic := '1';
    signal G2B : std_logic := '1';
    signal Y : std_logic_vector(7 downto 0);

begin
    -- Instantiate the decoder
    uut: decoder_74138 port map (
        A => A,
        B => B,
        C => C,
        G1 => G1,
        G2A => G2A,
        G2B => G2B,
        Y => Y
    );

    -- Stimulus process
    process
    begin
        -- Initialize all signals
        G1 <= '0'; G2A <= '1'; G2B <= '1';
        A <= '0'; B <= '0'; C <= '0';
        wait for 10 ns;

        -- Enable decoder and test all input combinations
        G1 <= '1'; G2A <= '0'; G2B <= '0';
        A <= '0'; B <= '0'; C <= '0'; wait for 10 ns;
        A <= '0'; B <= '0'; C <= '1'; wait for 10 ns;
        A <= '0'; B <= '1'; C <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; C <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; C <= '0'; wait for 10 ns;
        A <= '1'; B <= '0'; C <= '1'; wait for 10 ns;
        A <= '1'; B <= '1'; C <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; C <= '1'; wait for 10 ns;

        -- Disable decoder and check outputs
        G1 <= '0'; G2A <= '1'; G2B <= '1';
        A <= '0'; B <= '0'; C <= '0'; wait for 10 ns;
        A <= '0'; B <= '0'; C <= '1'; wait for 10 ns;
        A <= '0'; B <= '1'; C <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; C <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; C <= '0'; wait for 10 ns;
        A <= '1'; B <= '0'; C <= '1'; wait for 10 ns;
        A <= '1'; B <= '1'; C <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; C <= '1'; wait for 10 ns;

        wait;
    end process;
end rtl;
