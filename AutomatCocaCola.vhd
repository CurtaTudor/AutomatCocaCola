library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity AutomatCocaCola is
	port(GC,CLK:in STD_LOGIC;
	F:in STD_LOGIC_VECTOR(0 to 4);
	FS,EL,AM,RM,AT:out STD_LOGIC;
	REST:out NATURAL);
end AutomatCocaCola;

architecture structural of AutomatCocaCola is

component UC is
	port(GC,CLK:in STD_LOGIC;
	SUM:in NATURAL;
	FS,EL,RESET_SUM,EN,RM,AT:out STD_LOGIC;
	REST:out NATURAL);
end component;

component sumator is
	port(GC,EN,RESET:in STD_LOGIC;
	F:in STD_LOGIC_VECTOR(0 to 4);
	SUM:out NATURAL;
	AM:out STD_LOGIC);
end component;

signal EN,RESET_SUM:STD_LOGIC;
signal SUM:NATURAL;

begin
	C1: UC port map(GC,CLK,SUM,FS,EL,RESET_SUM,EN,RM,AT,REST);
	C2: sumator port map(GC,EN,RESET_SUM,F,SUM,AM);
end structural;












