library ieee;
use ieee.std_logic_1164.all;

entity decoder_74139 is
    port(
        G1 : in std_logic; 
        A, B : in std_logic;
        Y0, Y1, Y2, Y3 : out std_logic
    );
end decoder_74139;

architecture rtl of decoder_74139 is
begin
    
    Y0 <= (not(A) and not(B)) and G1;
    Y1 <= (not(A) and B) and G1;
    Y2 <= (A and not(B)) and G1;
    Y3 <= (A and B) and G1;
end rtl;
