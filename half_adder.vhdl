library IEEE;
use IEEE.std_logic_1164.all;

entity HALF_ADDER is
    port ( A : in std_ulogic;
           B : in std_ulogic;
           S : out std_ulogic;
           C : out std_ulogic);
end HALF_ADDER;

architecture STRUCTURE of HALF_ADDER is
begin
    S <= A XOR B;
    C <= A AND B;
end STRUCTURE;