library ieee;
use ieee.std_logic_1164.all;

entity alu is
    generic( 
        N: natural := 8 
    );
    port(
        A, B: in std_logic_vector(N-1 downto 0);
        C: in std_logic_vector(2 downto 0);
        S: out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture structural of alu is

-- SEU CODIGO AQUI
signal ALU_Result : std_logic_vector (7 downto 0);

begin

-- SEU CODIGO AQUI
	process(A,B,C)
	begin
		case(c) is
		when "000" => 
			ALU_Result <= A and B ; 
		when "001" => 
			ALU_Result <= A + B ; 
		when "010" => 
			ALU_Result <= A or B ; 
		when "101" => 
			ALU_Result <= A - B ; 
		end case;
	end process;
	S = ALU_Result;
end architecture;
