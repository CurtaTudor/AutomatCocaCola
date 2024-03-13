library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity modSim is
end modSim;

architecture simulare of modSim is

component AutomatCocaCola is
	port(GC,CLK:in STD_LOGIC;
	F:in STD_LOGIC_VECTOR(0 to 4);
	FS,EL,AM,RM,AT:out STD_LOGIC;
	REST:out NATURAL);
end component;

signal GC,CLK:STD_LOGIC;
signal F:STD_LOGIC_VECTOR(0 to 4);
signal FS,EL,AM,RM,AT:STD_LOGIC;
signal REST:NATURAL;

begin
	SIM: AutomatCocaCola port map(GC,CLK,F,FS,EL,AM,RM,AT,REST);
	F <= "00000", "00101" after 20 ns, "00000" after 40 ns,"00101" after 60 ns, "00000" after 80 ns, "00101" after 100 ns, "00000" after 120 ns,"00101" after 180 ns,"00000" after 200 ns,"01001" after 220 ns,"00000" after 240 ns,"10001" after 260 ns,"00000" after 280 ns,"10010" after 320 ns,"00000" after 340 ns,"00101" after 360 ns,"00000" after 380 ns,"00101" after 400 ns,"00000" after 420 ns,"00101" after 440 ns,"00000" after 460 ns,"00101" after 520 ns,"00000" after 540 ns;	
	GC <= '1' after 120 ns, '0' after 140 ns, '1' after 280 ns, '0' after 300 ns,'1' after 460 ns,'0' after 480 ns,'1' after 540 ns,'0' after 560 ns;
	
	generator_tact: process(CLK)
	begin
		if(CLK='U') then CLK <= '0';
		else
			CLK <= not CLK after 10 ns;
		end if;
	end process generator_tact;
	
end simulare;
	
	