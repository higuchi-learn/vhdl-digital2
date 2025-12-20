-- Peak Detection Circuit for Lab 4
-- AIT EV Digital Circuit 2 (2025)
-- Add your code in the commented regions.

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std_unsigned.ALL;

entity logic4 is
    port ( CLK, RST : in  std_ulogic;
           D        : in  std_ulogic_vector(3 downto 0);
           P        : out std_ulogic);
end logic4;

architecture RTL of logic4 is
    signal Q0, Q1, Q2 : std_ulogic_vector(3 downto 0);
begin
    -- write your code here --
    process (CLK) begin
        if rising_edge(CLK) then
            if RST = '1' then
                Q0 <= "0000";
                Q1 <= "0000";
                Q2 <= "0000";
            else
                Q2 <= Q1;
                Q1 <= Q0;
                Q0 <= D;
            end if;
        end if;
    end process;

    P <= '1' when (Q1 <= Q0 and Q1 <= Q2) else
        '1' when (Q1 >= Q0 and Q1 >= Q2) else
        '0';
    --   end of your code   --
end RTL;
