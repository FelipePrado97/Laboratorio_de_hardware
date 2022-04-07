library ieee;
use ieee.std_logic_1164.all;

entity mux2 is
    port (
        i0, i1: in std_logic;
        sel: in std_logic;
        s: out std_logic
    );
end entity;

architecture behavioral of mux2 is
begin

-- SEU CODIGO AQUI
	with sel select
		s <= i0 when '0',
	         i1 when '1';

end architecture;
