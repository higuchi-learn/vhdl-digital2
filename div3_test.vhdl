-- Testbench of 3-bit Divider Circuit for Lab 3
-- AIT EV Digital Circuit 2 (2025)
-- Add your code in the commented regions.

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std_unsigned.ALL;
use std.env.ALL;

entity div3_test is
end div3_test;

architecture sim of div3_test is
    component div3_ref is
        port ( A, B  : in  std_ulogic_vector(2 downto 0);
               Q_REF : out std_ulogic_vector(2 downto 0));
    end component;
    
    component div3 is
        port ( A, B : in  std_ulogic_vector(2 downto 0);
               Q    : out std_ulogic_vector(2 downto 0));
    end component;

    signal A, B     : std_ulogic_vector(2 downto 0);
    signal Q, Q_REF : std_ulogic_vector(2 downto 0);

begin
    L1 : div3_ref port map ( A, B, Q_REF );
    L2 : div3     port map ( A, B, Q );

    process begin
        A <= "000"; wait for 50 ns;
        A <= "001"; wait for 50 ns;
        A <= "010"; wait for 50 ns;
        A <= "011"; wait for 50 ns;
        A <= "100"; wait for 50 ns;
        A <= "101"; wait for 50 ns;
        A <= "110"; wait for 50 ns;
        A <= "111"; wait for 50 ns;
    end process;

    -- ヒント: B の時間変化とシミュレーションの終了
    -- write your code here --
    process begin
        -- student number : 24121
        -- 1
        B <= "001"; wait for 400 ns;
        -- 2
        B <= "010"; wait for 400 ns;
        -- 5
        B <= "101"; wait for 400 ns;
        wait;
    end process;

    process begin
        wait for 1200 ns;
        finish;
    end process;
    --   end of your code   --
end sim;
