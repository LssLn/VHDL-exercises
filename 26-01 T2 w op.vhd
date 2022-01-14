library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity  dp_t2c2 is
	port (d : in std_logic_vector(15 downto 0); --Din
    OP: in std_logic_vector(1 downto 0);
	clk, Wa, Wr: in std_logic;	
	ris: out std_logic_vector(15 downto 0) );
end dp_t2c2;

architecture beh of dp_t2c2 is
signal A,aluRis: std_logic_vector(15 downto 0); --Box gialli
--signal op: std_logic_vector(1 downto 0); --già in entity

begin
	
aluRis <= A + D when op = "11" else
		  A - D when op = "10" else
	      A or D when op = "01" else
          A and D when op = "00"
	
process(clk) 
begin
	if clk'event and clk='0' then
		if Wa='1' then A <= D;
		end if;
		--if Wo = '1' then op <= d(1 downto 0);
		--end if;
		if Wr = '1' then ris <= aluRis;
		end if;
	end if;
end process;
end beh;