library IEEE;
use IEEE.std_logic_1164.all;

package STATE_CONSTANTS is
	constant STATE_BITS: integer := 2
	constant S0: std_logic_vector(1 downto 0) := "00";
	constant S1: std_logic_vector(1 downto 0) := "01";
	constant S2: std_logic_vector(1 downto 0) := "11";
end package;
