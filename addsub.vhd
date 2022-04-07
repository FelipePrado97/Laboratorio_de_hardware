library ieee;
use ieee.std_logic_1164.all;

entity addsub is
    generic (
        N: natural := 8
    );
    port (
        A, B: in std_logic_vector(N-1 downto 0);
        operation: in std_logic;
        S: out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture behavioral of addsub is
begin

-- SEU CÓDIGO AQUI
	PROCESS (A, B, operation)
	BEGIN
		IF (operation = '1') THEN
			S <= A - B;
		ELSE
			S <= A + B;
		END IF;
	END PROCESS;

end architecture;