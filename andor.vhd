library ieee;
use ieee.std_logic_1164.all;

entity andor is
    generic (
        N: natural := 6
    );
    port (
        A, B: in std_logic_vector(N-1 downto 0);
        operation: in std_logic;
        S: out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture behavioral of andor is
begin

-- SEU CODIGO AQUI
PROCESS (A, B, operation)
	BEGIN
		IF (operation = '1') THEN
			S <= A AND B;
		ELSE
			S <= A OR B;
		END IF;
	END PROCESS;

end architecture;
