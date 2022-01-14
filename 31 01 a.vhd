lybrary ieee;
use ieee.std_logic_1164.all;

entity cu is
    port (stato,CNT : in std_logic_vector(1 downto 0);
        W1,W2,Exe,WR : out std_logic );
end cu;

architecture beh of cu is
begin
    w1 <= '1' when stato="01" else '0';
    w2 <= '1' when stato="10" else '0';
    exe <= '1' when stato="11" else '0';
    wr <= '1' when stato="1" and cnt="11" else '0';
end beh;
