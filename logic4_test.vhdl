-- Testbench of Peak Detection Circuit for Lab 4
-- AIT EV Digital Circuit 2 (2025)
-- Add your code in the commented regions.

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std_unsigned.ALL;
use std.env.ALL;

entity logic4_test is
end logic4_test;

architecture sim of logic4_test is
component logic4 is
    port ( CLK, RST : in  std_ulogic;
           D        : in  std_ulogic_vector(3 downto 0);
           P        : out std_ulogic);
end component;

signal CLK, RST, P : std_ulogic;
signal D           : std_ulogic_vector(3 downto 0);

begin
    L1 : logic4 port map ( CLK, RST, D, P );

    process begin
        CLK <= '1'; wait for 50 ns;
        CLK <= '0'; wait for 50 ns;
    end process;

    process begin
        RST <= '1'; wait for 110 ns;
        RST <= '0'; wait;
    end process;

    process begin
        D <= "0010"; wait for 210 ns; -- 2
        D <= "0000"; wait for 100 ns; -- 0
        D <= "0010"; wait for 100 ns; -- 2
        D <= "0101"; wait for 100 ns; -- 5
        -- write your code here --
        D <= "0010"; wait for 100 ns; -- 2
        D <= "0100"; wait for 100 ns; -- 4
        D <= "0001"; wait for 100 ns; -- 1
        D <= "0010"; wait for 100 ns; -- 2
        D <= "0001"; wait for 100 ns; -- 1
        --   end of your code   --
    end process;

    process begin
        wait for 1100 ns;
        finish;
    end process;
end sim;