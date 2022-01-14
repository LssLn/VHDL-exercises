library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity datapath is 
    port(d: in std_logic_vector(31 downto 0);
        clk,sel,WA,WB,WR: in std_logic;
        ris: out std_logic_vector(31 down to 0)    );
end datapath;

architecture behavioral of datapath is
    signal RegA,RegB: std_logic_vector(31 downto 0);
    signal mux: std_logic_vector(31 downto 0); --31:0 perchè ha come i 2 ingressi D[15:0] e RegS[15:0] = RegA[15:0]+D[15:0]
    begin
        process(RegA,RegB,d,sel)
        begin
            if sel='0' then -- RegA+D
                mux <= RegA+D;
            else mux <= D- RegB; -- D-RegB
            end if;
        end process;
        process(clk)
        begin
        if clk'event and clk='0' then
            if WA = '1' then RegA <= d; --RegA=d
            end if;
            if WB = '1' then RegB <= d; --RegB=d
            end if;
            if WR = '1' then Ris <= mux; --RegRis = RegS * D (prodotto è 31:0, Ris 15:0. Viene troncato)
            end if;
        end if;
    end process;
end behavioral;