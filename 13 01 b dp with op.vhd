library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity  dp_t2c2 is
	port (d : in std_logic_vector(31 downto 0);
	clk, Wa, Wo, Wr, comp: in std_logic;	
	ris: out std_logic_vector(31 downto 0) );
end dp_t2c2;

architecture beh of dp_t2c2 is
signal A,aluRis: std_logic_vector(31 downto 0);
signal op: std_logic_vector(1 downto 0);

begin
	
aluRis <= A + D when op = "00" else
		  A - D when op = "01" else
	      A or D;
	
process(clk) 
begin
	if clk'event and clk='0' then
		if Wa='1' then A <= D;
		end if;
		if Wo = '1' then op <= d(1 downto 0);
		end if;
		if Wr = '1' and comp='1' then ris <= aluRis;
		end if;
	end if;
end process;
end beh;