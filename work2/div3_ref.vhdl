-- 3-bit Divider Circuit for Lab 3 (using "/" For Reference)
-- AIT EV Digital Circuit 2 (2025)
-- Add your code in the commented regions.

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std_unsigned.ALL;

entity div3_ref is
    port ( A, B  : in  std_ulogic_vector(2 downto 0);
           Q_REF : out std_ulogic_vector(2 downto 0));
end div3_ref;

architecture behavioral of div3_ref is
begin
    -- write your code here --
    Q_REF <= A / B;
    --   end of your code   --
end behavioral;
