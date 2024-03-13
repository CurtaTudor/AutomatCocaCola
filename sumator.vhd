library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity sumator is
	port(GC,EN,RESET:in STD_LOGIC;
	F:in STD_LOGIC_VECTOR(0 to 4);
	SUM:out NATURAL;
	AM:out STD_LOGIC);
end sumator;

architecture comportamental of sumator is
begin
	process(GC,EN,RESET,F)
	variable curentSum:NATURAL:=0;
	begin
		if(RESET='1') then
			curentSum:=0;
		elsif EN='1' then
			if(GC='1') then SUM <= curentSum;
			else
				case F is
					when "10001" =>
					curentSum:=curentSum+5;
					AM <= '0';
					
					when "01001" =>
					curentSum:=curentSum+10;
					AM <= '0';
					
					when "00101" =>
					curentSum:=curentSum+50;
					AM <= '0';
					
					when "00000" => AM <= '0';
					
					when others => AM <='1';
				end case;
			end if;
		else null;
		end if;
	end process;
end comportamental;
			