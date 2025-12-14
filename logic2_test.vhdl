-- Test Bench of Bit Rotate Circuit for Lab 2
-- AIT EV Digital Circuit 2 (2025)
-- Modify the code in the commented region.

library IEEE;
use IEEE.std_logic_1164.ALL;
use std.env.ALL;

entity logic2_test is
end logic2_test;

architecture sim of logic2_test is
component logic2 is
    port ( A    : in  std_logic_vector(7 downto 0);
           L_RX : in  std_logic;
           Y    : out std_logic_vector(7 downto 0));
end component;

signal A    : std_logic_vector(7 downto 0);
signal L_RX : std_logic;
signal Y    : std_logic_vector(7 downto 0);

begin
    L1 : logic2 port map ( A, L_RX, Y );

    -- modify the code below --
    process begin
        L_RX <= '0'; wait for 100 ns;
        L_RX <= '1'; wait for 100 ns;
    end process;

    process begin
        -- 1
        A <= "00000001"; wait for 200 ns;
        -- 121
        A <= "01111001"; wait for 200 ns;
        -- 248
        A <= "11111000"; wait for 200 ns;
    end process;
    --    end of the code    --

    process begin
        wait for 600 ns;
        finish;
    end process;
end sim;
