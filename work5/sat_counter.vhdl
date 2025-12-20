-- 2-bit Saturating Counter for Lab 5
-- AIT EV Digital Circuit 2 (2025)
-- Add your code in the commented region.

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std_unsigned.ALL;

entity sat_counter is
    port ( CLK, RST, A : in  std_ulogic;
           Y           : out std_ulogic);
end sat_counter;

-- 注意: 型や内部信号を宣言したあと，begin を書くのを忘れないように！

architecture RTL of sat_counter is
-- write your core here --
    type STATE_TYPE is (Q0, Q1, Q2, Q3);
    signal STATE, NEXT_STATE : STATE_TYPE;

begin
    process (all) begin
        NEXT_STATE <= STATE;
        Y          <= '0';
        if STATE = Q0 then
            if A = '1' then
                NEXT_STATE <= Q1;
            end if;
        elsif STATE = Q1 then
            if A = '1' then
                NEXT_STATE <= Q2;
            else
                NEXT_STATE <= Q0;
            end if;
        elsif STATE = Q2 then
            Y <= '1';
            if A = '1' then
                NEXT_STATE <= Q3;
            else
                NEXT_STATE <= Q1;
            end if;
        elsif STATE = Q3 then
            Y <= '1';
            if A = '0' then
                NEXT_STATE <= Q2;
            end if;
        end if;
    end process;

    process (CLK) begin
        if rising_edge(CLK) then
            if RST = '1' then
                STATE <= Q1;
            else
                STATE <= NEXT_STATE;
            end if;
        end if;
    end process;
--   end of your code   --
end RTL;
