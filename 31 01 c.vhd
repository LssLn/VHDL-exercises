lybrary ieee;
use ieee.std_logic_1164.all;

entity cu is
    port (stato : in std_logic_vector(1 downto 0);
        sel : in std_logic;
        W1,W2,S1,S2,W3 : out std_logic );
end cu;

architecture beh of cu is
begin
    --w1 <= '1' when stato="01" else '0';
    --w1 <= '1' when stato="10" and sel='0' else '0';
    w1 <= '1' when stato="01" or(stato="10" and sel='0') else '0';
    s1 <= '1' when stato="10" and sel='0' else '0';
    --w2 <= '1' when stato="01" else '0';
    --w2 <= '1' when stato="10" and sel='1' else '0';
    w2 <= '1' when stato="01" or(stato="10" and sel='1') else '0';
    
    s2 <= '1' when stato="10" and sel='1' else '0';
    w3 <= '1' when stato='11' else '0';

end beh;