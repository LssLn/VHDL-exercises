lybrary ieee;
use ieee.std_logic_1164.all;

entity cu is
    port (stato,en : in std_logic;
        W1,W2,Exe,Ready : out std_logic );
end cu;

architecture beh of cu is
begin
    
    w1 <= '1' when (stato="001" or stato="000") and en='1' else '0';
    w1 <= '1' when (stato="010" or stato="000") and en='1' else '0';
    --w2 <= '1' when stato="01" else '0';
    --w2 <= '1' when stato="10" and sel='1' else '0';
    Exe <= '1' when stato="011" and en='1' else '0';
    Ready <= '1' when stato="100" and en='1' else '0';

end beh;
