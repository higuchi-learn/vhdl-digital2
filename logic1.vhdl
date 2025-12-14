-- Simple Combinatorial Circuit for Lab 1
-- AIT EV Digital Circuit 2 (2025)
-- Write your code below the comment at Line 16.

library IEEE;
use IEEE.std_logic_1164.ALL;

entity logic1 is
    port ( L, M, N : in  std_ulogic;
           X       : out std_ulogic);
end logic1;

architecture RTL of logic1 is
    signal T1, T2 : std_ulogic;
begin
    -- write your code here
    T1 <= L and M;
    T2 <= not N and M and not L;
    X <= T1 or T2;
end RTL;
