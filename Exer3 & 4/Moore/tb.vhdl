library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.STATE_CONSTANTS.all;

entity tb is
	constant PERIOD1 : time := 100 ns;
end entity tb;

architecture tb of tb is
	signal disp: std_logic;
  signal chng: std_logic;
	signal state: std_logic_vector(STATE_BITS-1 downto 0);
	signal reset_n: std_logic;
	signal clk: std_logic := '0';
	signal x: std_logic;

	component main is port(
                disp: out std_logic;
                chng: out std_logic;
								state: out std_logic_vector(STATE_BITS-1 downto 0);
								reset_n: in std_logic;
								clk: in std_logic;
								x: in std_logic);
	end component main;

  procedure check_state_disp(expected_state: std_logic_vector(STATE_BITS-1 downto 0);
							expected_disp: std_logic;
							actual_state: std_logic_vector(STATE_BITS-1 downto 0);
							actual_disp: std_logic;
							error_count: inout integer) is

		begin
			assert expected_state = actual_state
			--report "ERROR: Expected state (" & std_logic'image(expected_state(1) & std_logic'image(expected_state(0)) & ") /= actual (" & std_logic'image(actual_state(1)) & std_logic'image(actual_state(0)) & ") at time " & time'image(now);
			report "ERROR!";
			--checking state
			if(expected_state /= actual_state) then
				error_count := error_count + 1;
			end if;
			--checking disp output
			if(expected_disp /= actual_disp) then
				report "ERROR: Expected output disp (" & std_logic'image(expected_disp) & ") /= actual (" & std_logic'image(actual_disp) & ") at time " & time'image(now);
				error_count := error_count + 1;
			end if;
		end procedure check_state_disp;

    procedure check_state_chng(expected_state: std_logic_vector(STATE_BITS-1 downto 0);
  							expected_chng: std_logic;
  							actual_state: std_logic_vector(STATE_BITS-1 downto 0);
  							actual_chng: std_logic;
  							error_count: inout integer) is

      begin
				--checking chng output
  			if(expected_chng /= actual_chng) then
  				report "ERROR: Expected output chng (" & std_logic'image(expected_chng) & ") /= actual (" & std_logic'image(actual_chng) & ") at time " & time'image(now);
  				error_count := error_count + 1;
  			end if;
  		end procedure check_state_chng;

	begin

		main1: component main port map(disp, chng, state, reset_n, clk, x);

		reset_n <= '1', '0' after (PERIOD1/4),
					'1' after (PERIOD1 + PERIOD1/4);

		clock: clk <= not clk after (PERIOD1/2);

		maintest: process is
			variable error_count: integer:= 0;

			begin
				report "Start Simulation...";
        x <= '1'; --constant 5php input
    		wait for PERIOD1;
    		check_state_disp(s00, '0', state, disp, error_count);
        check_state_chng(s00, '0', state, chng, error_count);
        wait for PERIOD1;
        check_state_disp(s05, '0', state, disp, error_count);
        check_state_chng(s05, '0', state, chng, error_count);
    		wait for PERIOD1;
    		check_state_disp(s10, '0', state, disp, error_count);
    		check_state_chng(s10, '0', state, chng, error_count);
    		wait for PERIOD1;
    		check_state_disp(s15, '0', state, disp, error_count);
        check_state_chng(s15, '0', state, chng, error_count);
    		wait for PERIOD1; --expected to have change and dispense.
    		check_state_disp(s17, '1', state, disp, error_count);
        check_state_chng(s17, '1', state, chng, error_count);
    		wait for PERIOD1;
    		check_state_disp(s05, '0', state, disp, error_count);
        check_state_chng(s05, '0', state, chng, error_count);
    -- 2nd round
    		x <= '0'; --constant 1php input
    		wait for PERIOD1;
    		check_state_disp(s06, '0', state, disp, error_count);
    		check_state_chng(s06, '0', state, chng, error_count);
    		wait for PERIOD1;
    		check_state_disp(s07, '0', state, disp, error_count);
    		check_state_chng(s07, '0', state, chng, error_count);
    		wait for PERIOD1;
    		check_state_disp(s08, '0', state, disp, error_count);
    		check_state_chng(s08, '0', state, chng, error_count);
    		wait for PERIOD1;
    		check_state_disp(s09, '0', state, disp, error_count);
    		check_state_chng(s09, '0', state, chng, error_count);
    		wait for PERIOD1;
    		check_state_disp(s10, '0', state, disp, error_count);
    		check_state_chng(s10, '0', state, chng, error_count);
    		wait for PERIOD1;
    		check_state_disp(s11, '0', state, disp, error_count);
    		check_state_chng(s11, '0', state, chng, error_count);
    		wait for PERIOD1;
    		check_state_disp(s12, '0', state, disp, error_count);
    		check_state_chng(s12, '0', state, chng, error_count);
    		wait for PERIOD1;
    		check_state_disp(s13, '0', state, disp, error_count);
    		check_state_chng(s13, '0', state, chng, error_count);
    		wait for PERIOD1;
    		check_state_disp(s14, '0', state, disp, error_count);
    		check_state_chng(s14, '0', state, chng, error_count);
    		wait for PERIOD1;
    		check_state_disp(s15, '0', state, disp, error_count);
    		check_state_chng(s15, '0', state, chng, error_count);
    		wait for PERIOD1;
    		check_state_disp(s16, '1', state, disp, error_count);
    		check_state_chng(s16, '0', state, chng, error_count);


				if(error_count = 0) then
					report "tagumpay! walang error!";
				else
					report "May " & integer'image(error_count) & " errors";
				end if;

				wait;

			end process maintest;

	end architecture tb;
