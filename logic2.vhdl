-- Left/Right Bit Rotate Circuit for Lab 2
-- AIT EV Digital Circuit 2 (2025)
-- Write your code below the comment at Line 17.

library IEEE;
use IEEE.std_logic_1164.ALL;

entity logic2 is
    port ( A    : in  std_logic_vector(7 downto 0);
           L_RX : in  std_logic;
           Y    : out std_logic_vector(7 downto 0));
end logic2;

architecture BEHAVIOR of logic2 is
begin
    process (all) begin
        -- write your code here
        if L_RX = '1' then
            Y <= A(6 downto 0) & A(7);  -- Left Rotate
        else
            Y <= A(0) & A(7 downto 1);  -- Right Rotate
        end if;
    end process;
end BEHAVIOR;
