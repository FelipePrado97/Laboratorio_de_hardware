library ieee;
use ieee.std_logic_1164.all;

entity multiplex2x1 is
    generic (
        N: natural := 4
    );
    port (
        input0, input1: in std_logic_vector(N-1 downto 0);
        sel: in std_logic;
        output: out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture behavioral of multiplex2x1 is
begin

-- SEU CÓDIGO AQUI
	with sel select
		output <= input0 when '0',
		 		  input1 when others;

end architecture;
