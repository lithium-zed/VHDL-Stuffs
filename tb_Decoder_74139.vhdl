library ieee;
use ieee.std_logic_1164.all;

entity tb_decoder_74139 is
end tb_decoder_74139;

architecture rtl of tb_decoder_74139 is
    component decoder_74139 is
        port(
            G1 : in std_logic;
            A, B : in std_logic;
            Y0, Y1, Y2, Y3 : out std_logic
        );
    end component;

    signal G1 : std_logic := '0';
    signal A, B : std_logic := '0';
    signal Y0, Y1, Y2, Y3 : std_logic;

begin
    -- Instantiate the decoder
    uut: decoder_74139 port map (
        G1 => G1,
        A => A,
        B => B,
        Y0 => Y0,
        Y1 => Y1,
        Y2 => Y2,
        Y3 => Y3
    );

    -- Stimulus process
    process
    begin
        -- Initialize all signals
        G1 <= '0';
        A <= '0';
        B <= '0';
        wait for 10 ns;

        -- Enable decoder and test all input combinations manually
        G1 <= '1';
        A <= '0'; B <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; wait for 10 ns;

        -- Disable decoder and check outputs
        G1 <= '0';
        A <= '0'; B <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; wait for 10 ns;

        wait;
    end process;
end rtl;
