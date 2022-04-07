library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;

entity alarm is
    generic (
        N: natural
    );
    port (
        sensors: in std_logic_vector(0 to N-1);
        key: in std_logic;
        clock: in std_logic;
        siren: out std_logic
    );
end entity;

architecture behavioral of alarm is

	type state_type is(Desligado, Armando, Ligado, Acionando, Tocando);
	signal current_state, next_state : state_type;

begin
	process(clock)
		variable tempo : integer := 0;
	begin
		tempo := tempo + 1;
		if(clock'event and clock = '1' and tempo = 30) then
			current_state <= next_state;
			tempo := 0;
		end if;
	end process;

	process(sensors, key, current_state)
	begin
		case current_state is
			when Desligado =>
				if(key = '1') then
					next_state <= Armando;
				else
					next_state <= Desligado;
				end if;
				siren <= '0';
			when Armando =>
				if(key = '1') then 
					next_state <= Ligado;
				else
					next_state <= Desligado;
				end if;
				siren <= '0';
			when Ligado =>
				if(key = '1')then
					for i in 0 to N-1 loop
                        if (sensors(i) = '1') then
                            next_state <= Acionando;
                        else 
                            next_state <= Ligado;
                        end if;
                    end loop;
                 else
                 	next_state <= Desligado;
                end if;
                siren <= '0';
			when Acionando =>
				if(key = '0')then
					next_state <= Desligado;
				else
					next_state <= Tocando;
				end if;
				siren <= '0';
			when Tocando =>
                if (key = '1') then
                    next_state <= Tocando;
                    siren <= '1'; 
                else 
                    next_state <= Desligado;
                    siren <= '0'; 
                end if;
            end case;
        end process;
end architecture;
