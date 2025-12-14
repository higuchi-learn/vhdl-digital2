library IEEE;
use IEEE.std_logic_1164.all;

entity VENDING1 is
    port ( COIN     : in  std_ulogic_vector(1 downto 0);
           CLK, RST : in  std_ulogic;
           CAN      : out std_ulogic;
           BALANCE  : out std_ulogic);
end VENDING1;

architecture RTL of VENDING1 is
    type STATE_TYPE is (Q0, Q50, Q100);
    signal STATE, NEXT_STATE : STATE_TYPE;

begin
    process (all) begin
        NEXT_STATE <= STATE;
        CAN        <= '0';
        BALANCE    <= '0';
        if STATE = Q0 then
            if COIN = "01" then
                NEXT_STATE <= Q50;
            elsif COIN = "10" then
                NEXT_STATE <= Q100;
            end if;
        elsif STATE = Q50 then
            if COIN = "01" then
                NEXT_STATE <= Q100;
            elsif COIN = "10" then
                NEXT_STATE <= Q0;
                CAN        <= '1';
            end if;
        elsif STATE = Q100 then
            if COIN = "01" then
                NEXT_STATE <= Q0;
                CAN        <= '1';
            elsif COIN = "10" then
                NEXT_STATE <= Q0;
                CAN        <= '1';
                BALANCE    <= '1';
            end if;
        end if;
    end process;

    process (CLK) begin
        if rising_edge(CLK) then
            if RST = '1' then
                STATE <= Q0;
            else
                STATE <= NEXT_STATE;
            end if;
        end if;
    end process;
end RTL;
