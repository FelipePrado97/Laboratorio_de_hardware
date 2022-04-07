library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shiftrotater is
    port (
        din:    in std_logic_vector(3 downto 0);
        desloc: in std_logic_vector(1 downto 0);
        shift:  in std_logic;
        dout:   out std_logic_vector(3 downto 0)
    );
end entity;

architecture structural of shiftrotater is

-- SEU CODIGO AQUI
	signal w,x,y,z,s0, s1, s2: in std_logic;

begin

-- SEU CODIGO AQUI
	begin
		DIN3 : entity work.mux2(behavioral)
	    port map(i0=>din(3), i1=>din(2), sel=>desloc(0),s=>w);

	    DIN2 : entity work.mux2(behavioral)
	    port map(i0=>din(2), i1=>din(1), sel=>desloc(0),s=>x);

	    DIN1 : entity work.mux2(behavioral)
	    port map(i0=>din(1), i1=>din(0), sel=>desloc(0),s=>y);

	    SH0 :  entity work.mux2(behavioral)
	    port map(i0=>din(3), i1=>0, sel=>shift(0),s=>s0);

	    DIN0 : entity work.mux2(behavioral)
	    port map(i0=>din(0), i1=>s0, sel=>desloc(0),s=>z);

	    SH1 : entity work.mux2(behavioral)
	    port map(i0=>w, i1=>0, sel=>shift(1),s=>s1);

	    SW :  entity work.mux2(behavioral)
	    port map(i0=>w, i1=>s1, sel=>desloc(1),s=>dout(3));

	    SH2 : entity work.mux2(behavioral)
	    port map(i0=>x, i1=>0, sel=>shift(1),s=>s2);

		SX : entity work.mux2(behavioral)
	    port map(i0=>x, i1=>z, sel=>desloc(1),s=>dout(2));

	    SY : entity work.mux2(behavioral)
	    port map(i0=>y, i1=>s1, sel=>desloc(1),s=>dout(1));

	    SZ : entity work.mux2(behavioral)
	    port map(i0=>z, i1=>s2, sel=>desloc(1),s=>dout(0));

end architecture;