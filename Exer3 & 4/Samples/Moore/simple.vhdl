library IEEE;
use IEEE.std_logic_1164.all;

package STATE_CONSTANTS is
	constant STATE_BITS: integer := 2;
	constant S0: std_logic_vector(1 downto 0) := "00";
	constant S1: std_logic_vector(1 downto 0) := "01";
	constant S2: std_logic_vector(1 downto 0) := "11";
end package;

library IEEE;
use IEEE.std_logic_1164.all;
use work.STATE_CONSTANTS.all;

entity simple is

	port (z: out std_logic;
		  state: out std_logic_vector(STATE_BITS-1 downto 0);
		  reset_n: in std_logic;
		  clk: in std_logic;
		  x: in std_logic);

end entity simple;

architecture simple of simple is

	signal internal_state: std_logic_vector(STATE_BITS-1 downto 0);
	
	begin
	
		state <= internal_state;
		
		form_output: process(internal_state) is
		begin
			case internal_state is
				when S0 => z <= '0';
				when S1 => z <= '0';
				when S2 => z <= '1';
				when others => z <= 'X';
			end case;
		end process form_output;
		
		next_state: process(reset_n, clk) is
		begin
			if (reset_n = '0') then
				internal_state <= S0;
			elsif rising_edge(clk) then
				case internal_state is
					when S0 =>
						if (x = '1') then
							internal_state <= S1;
						else
							internal_state <= S2;
						end if;
					when S1 =>
						if (x /= '1') then
							internal_state <= S2;
						end if;
					when S2 => internal_state <= S0;
					when others => internal_state <= "XX";
				end case;
			end if;
		end process next_state;
		
	end architecture simple;