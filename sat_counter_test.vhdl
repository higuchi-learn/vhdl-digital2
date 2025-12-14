-- Testbench of 2-bit Saturating Counter for Lab 5
-- AIT EV Digital Circuit 2 (2025)
-- Add your code in the commented region.

library IEEE;
use IEEE.std_logic_1164.ALL;
use std.env.ALL;

entity sat_counter_test is
end sat_counter_test;

architecture sim of sat_counter_test is
component sat_counter is
    port ( CLK, RST, A : in  std_ulogic;
           Y           : out std_ulogic);
end component;

signal CLK, RST, A : std_ulogic;
signal Y           : std_ulogic;

begin
    L1 : sat_counter port map ( CLK, RST, A, Y );

    -- write your code here --
    process begin
        CLK <= '1'; wait for 50 ns;
        CLK <= '0'; wait for 50 ns;
    end process;

    process begin
        RST <= '1'; wait for 150 ns;
        RST <= '0'; wait;
    end process;

    process begin
        A <= '1'; wait for 250 ns;
        A <= '0'; wait for 200 ns;
        A <= '1'; wait for 300 ns;
        A <= '0'; wait for 100 ns;
        A <= '1'; wait for 100 ns;
        A <= '0'; wait for 200 ns;
    end process;
    --   end of your code   --

    process begin
        wait for 1200 ns;
        finish;
    end process;
end sim;
