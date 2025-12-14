-- 3-bit Divider Circuit for Lab 3
-- AIT EV Digital Circuit 2 (2025)
-- Add your code in the commented regions. Do not use the "/" operator.

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std_unsigned.ALL;

entity div3 is
    port ( A, B : in  std_ulogic_vector(2 downto 0);
           Q    : out std_ulogic_vector(2 downto 0));
end div3;

architecture behavioral of div3 is
    signal numer : std_ulogic_vector(2 downto 0); -- 分子 (numerator)
    -- ヒント: (2) 積を内部信号として宣言する
    -- write your code here --
    signal product : std_ulogic_vector(5 downto 0); -- 積 (product)
    --   end of your code   --
begin
    process (B) begin -- (1) 除数から分子を求める
        case (B) is
            when "001"  => numer <= "001";
            when "010"  => numer <= "100";
            when "011"  => numer <= "011";
            when "100"  => numer <= "010";
            when "101"  => numer <= "111";
            when "110"  => numer <= "110";
            when "111"  => numer <= "101";
            when others => numer <= "000";
        end case;
    end process;

    -- ヒント: (2) 積の値を定義する + (3) B の値で場合分けする
    -- write your code here --
    product <= A * numer;
    process (A, B, product)
        variable shifted_product : std_ulogic_vector(5 downto 0);
    begin
        -- process内でproduct <= A * numer;を書くと,
        -- productのsignal更新が次clockになるため正しい動作をしなくなる.
        if B = "001" then
            Q <= product(2 downto 0);
        elsif B <= "100" then
            -- Q <= (product srt 3)(2 downto 0);としたいが,
            -- (...)(...)のような書き方は構文エラーになる.
            shifted_product := product srl 3;
            Q <= shifted_product(2 downto 0);
        else
            shifted_product := product srl 5;
            Q <= shifted_product(2 downto 0);
        end if;
    end process;
    --   end of your code   --
end behavioral;
