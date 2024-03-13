library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity UC is
	port(GC,CLK:in STD_LOGIC;
	SUM:in NATURAL;
	FS,EL,RESET_SUM,EN,RM,AT:out STD_LOGIC;
	REST:out NATURAL);
end UC;

architecture ARH of UC is

type STARE is (A,B,C,D);
signal STARE_CURENTA,STARE_URM:STARE;
signal numarCola:NATURAL:=2;

begin
	
	ACTUALIZEAZA_STARE: process(CLK)
	begin
		if(CLK'EVENT and CLK='1') then STARE_CURENTA <= STARE_URM;
		else null;
		end if;
	end process ACTUALIZEAZA_STARE;
	
	TRANZITII: process(STARE_CURENTA,GC,SUM)
	variable curentSum:NATURAL;
	begin
		case STARE_CURENTA is
			
			when A =>
			REST <= 0;
			FS <='0';
			EL <='0';
			AT <= '0';
			RESET_SUM <='1';
			if(numarCola>0) then
				EN<='1';
				STARE_URM <= C;
			else STARE_URM <= B;
			end if;
			
			when B =>
			FS <= '1';
			if(numarCola>0) then
				FS<='0';
				EN<='1';
				STARE_URM <= C;
			else STARE_URM <= B;
			end if;
			
			when C =>
			REST <= 0;
			RESET_SUM <= '0';
			RM <= '0';
			AT <= '0';
			if(GC='1') then
				EN<='0';
				STARE_URM <= D;
				AT <= '1';
			else STARE_URM <= C;
			end if;
			
			when others =>
			curentSum:=SUM;
			if(curentSum<100) then
				EN<='1';
				REST<=curentSum;
				RESET_SUM<='1';
				STARE_URM<=C;
				RM <= '1';
			else
				EL<='1';
				curentSum:=curentSum-100;
				REST <= curentSum;
				if(GC='1') then numarCola <= numarCola-1;
				end if;
				STARE_URM<=A;
			end if;
		end case;
	end process TRANZITII;
end ARH;
			
			
			
		
		
		
		
		
		
		
		