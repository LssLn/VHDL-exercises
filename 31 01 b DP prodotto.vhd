library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity datapath is 
    port(d: in std_logic_vector(15 down to 0);
        clk,WA,WS,WP: in std_logic;
        ris: out std_logic_vector(15 down to 0)    );
end datapath;

architecture behavioral of datapath is
    signal RegA,RegS: std_logic_vector(15 downto 0);
    signal prodotto: std_logic_vector(31 downto 0); --31:0 perchè ha come i 2 ingressi D[15:0] e RegS[15:0] = RegA[15:0]+D[15:0]
    begin
        prodotto <= RegS * D;
        process(clk)
        begin
        if clk'event and clk='0' then
            if WA = '1' then RegA <= d; --RegA
            end if;
            if WS = '1' then RegS <= RegA+d; --RegS = RegA+D
            end if;
            if WP = '1' then Ris <= prodotto (15 downto 0); --RegRis = RegS * D (prodotto è 31:0, Ris 15:0. Viene troncato)
            end if;
        end if;
    end process;
end behavioral;