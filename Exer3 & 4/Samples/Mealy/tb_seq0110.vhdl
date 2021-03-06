library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.MEALY_CONSTANTS.all;

entity tb_seq0110 is
	constant PERIOD1 : time := 100 ns;
end entity tb_seq0110;

architecture tb_seq0110 of tb_seq0110 is
	signal z: std_logic;
	signal state: std_logic_vector(STATE_BITS-1 downto 0);
	signal reset_n: std_logic;
	signal clk: std_logic := '0';
	signal x: std_logic;
	
	component seq0110 is port(z: out std_logic;
								state: out std_logic_vector(STATE_BITS-1 downto 0);
								reset_n: in std_logic;
								clk: in std_logic;
								x: in std_logic);
	end component seq0110;
	
	procedure check_state_z(expected_state: std_logic_vector(STATE_BITS-1 downto 0);
							expected_z: std_logic;
							actual_state:std_logic_vector(STATE_BITS-1 downto 0);
							actual_z: std_logic;
							error_count: inout integer) is
		begin
			assert (expected_state = actual_state)
			report "Error: Expected State (" & std_logic'image(expected_state(1)) & std_logic'image(expected_state(0)) & ") /= actual (" & std_logic'image(actual_state(1)) & std_logic'image(actual_state(0)) & ") at time " & time'image(now);
			if (expected_state /= actual_state) then
				error_count := error_count + 1;
			end if;
			assert (expected_z = actual_z)
			report "Error: Expected z (" & std_logic'image(expected_z)& ") /= actual (" & std_logic'image(actual_z) & ") at time " & time'image(now);
			if (expected_z /= actual_z) then
				error_count := error_count + 1;
			end if;
	end procedure check_state_z;
	
	begin
	
	u0: component seq0110 port map(z, state, reset_n, clk, x);
	
	reset_n <= '1', '0' after (PERIOD1 / 4), '1' after (PERIOD1 + PERIOD1/4);
	
	clock: clk <= not clk after (PERIOD1 / 2);
	
	main: process is
		variable error_count: integer := 0; 
	begin
		report "Start simulation.";
		x <= '0';
		wait for PERIOD1;
		check_state_z(s0, '0', state, z, error_count);
		x <= '1';
		wait for PERIOD1;
		check_state_z(s0, '0', state, z, error_count);
		x <= '0';
		wait for PERIOD1;
		check_state_z(s1, '0', state, z, error_count);
		x <= '0';
		wait for PERIOD1;
		check_state_z(s1, '0', state, z, error_count);
		x <= '1';
		wait for PERIOD1;
		check_state_z(s2, '0', state, z, error_count);
		x <= '0';
		wait for PERIOD1;
		check_state_z(s1, '0', state, z, error_count);
		x <= '1';
		wait for PERIOD1;
		check_state_z(s2, '0', state, z, error_count);
		x <= '1';
		wait for PERIOD1;
		check_state_z(s3, '0', state, z, error_count);
		x <= '1';
		wait for PERIOD1;
		check_state_z(s0, '0', state, z, error_count);
		x <= '0';
		wait for PERIOD1;
		check_state_z(s1, '0', state, z, error_count);
		x <= '1';
		wait for PERIOD1;
		check_state_z(s2, '0', state, z, error_count);
		x <= '1';
		wait for PERIOD1;
		check_state_z(s3, '0', state, z, error_count);
		x <= '0';
		wait for PERIOD1/4;
		check_state_z(s3, '1', state, z, error_count);
		wait for 3*(PERIOD1/4);
		check_state_z(s1, '0', state, z, error_count);
		x <= '0';
		check_state_z(s1, '0', state, z, error_count);
		wait for PERIOD1;
		
		assert(error_count = 0)
		report "ERROR: There were " & integer'image(error_count) & " errors.";
		if (error_count = 0) then
			report "Simulation completed with NO errors.";
		end if;
		wait;
		
	end process main;
	
end architecture tb_seq0110;