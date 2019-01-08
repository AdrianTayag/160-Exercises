library IEEE;
use IEEE.std_logic_1164.all;

package MEALY_CONSTANTS is
	constant STATE_BITS: integer := 2;
	constant s0: std_logic_vector(1 downto 0) := "00";
	constant s1: std_logic_vector(1 downto 0) := "01";
	constant s2: std_logic_vector(1 downto 0) := "10";
	constant s3: std_logic_vector(1 downto 0) := "11";
end package;

--Description: Implements a Mealy machine that detects the bit-serial input sequence 0110.

library IEEE;
use IEEE.std_logic_1164.all;
use work.MEALY_CONSTANTS.all;

entity seq0110 is
	port (z: out std_logic;
			state: out std_logic_vector(STATE_BITS-1 downto 0);
			reset_n: in std_logic;
			clk: in std_logic;
			x: in std_logic);
end entity seq0110;

architecture seq0110 of seq0110 is
	signal internal_state: std_logic_vector(STATE_BITS-1 downto 0);
begin
	state <= internal_state;

	compute_output: process(internal_state, x) is
	begin
		if((internal_state = s3) and (x = '0')) then
			z <= '1';
		else
			z <= '0';
		end if;
	end process compute_output;

	next_state: process(clk) is
	begin
		if((reset_n = '0') and rising_edge(clk)) then
			internal_state <= s0;
		elsif rising_edge(clk) then
			case internal_state is
				when s0 => -- state conditional statements
					if (x = '0') then
						internal_state <= s1;
					else
						internal_state <= s0;
					end if;
				when s1 =>
					if (x = '1') then
						internal_state <= s2;
					else
						internal_state <= s1;
					end if;
				when s2 =>
					if (x = '1') then
						internal_state <= s3;
					else
						internal_state <= s1;
					end if;
				when others =>
					if (x = '0') then
						internal_state <= s1;
					else
						internal_state <= s0;
					end if;
			end case;
		end if;
	end process next_state;
end architecture seq0110;
