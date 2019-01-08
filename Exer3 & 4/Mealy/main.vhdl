library IEEE;
use IEEE.std_logic_1164.all;

-- declaring all possible states of the fsm
package MEALY_CONSTANTS is
	constant STATE_BITS: integer := 5;
	constant s00: std_logic_vector(4 downto 0) := "00000";
	constant s01: std_logic_vector(4 downto 0) := "00001";
	constant s02: std_logic_vector(4 downto 0) := "00010";
	constant s03: std_logic_vector(4 downto 0) := "00011";
  constant s04: std_logic_vector(4 downto 0) := "00100";
  constant s05: std_logic_vector(4 downto 0) := "00101";
  constant s06: std_logic_vector(4 downto 0) := "00110";
  constant s07: std_logic_vector(4 downto 0) := "00111";
  constant s08: std_logic_vector(4 downto 0) := "01000";
  constant s09: std_logic_vector(4 downto 0) := "01001";
  constant s10: std_logic_vector(4 downto 0) := "01010";
  constant s11: std_logic_vector(4 downto 0) := "01011";
  constant s12: std_logic_vector(4 downto 0) := "01100";
  constant s13: std_logic_vector(4 downto 0) := "01101";
  constant s14: std_logic_vector(4 downto 0) := "01110";
  constant s15: std_logic_vector(4 downto 0) := "01111";
	constant s16: std_logic_vector(4 downto 0) := "10000";
	constant s17: std_logic_vector(4 downto 0) := "10001";
end package;

--Description: A Mealy Machine that dispenses product and provides change at a fixed price of 16php

library IEEE;
use IEEE.std_logic_1164.all;
use work.MEALY_CONSTANTS.all;

entity main is
	port (disp: out std_logic;
        chng: out std_logic;
			  state: out std_logic_vector(STATE_BITS-1 downto 0); -- just state how many outputs
			  reset_n: in std_logic;
			  clk: in std_logic;
			  x: in std_logic);
end entity main;

architecture main of main is
	signal internal_state: std_logic_vector(STATE_BITS-1 downto 0);
begin
	state <= internal_state;
 -- if (output state bubble) and (input state) then this is the output
	compute_output: process(internal_state, x) is
	begin
		if ((internal_state = s16) and (x = '0')) then --from s15
			disp <= '1';
			chng <= '0';
		elsif ((internal_state = s16) and (x = '1')) then --everything else
			disp <= '1';
			chng <= '1';
		elsif ((internal_state = s17) and (x = '0')) then --won't happen but will be included in case.
			disp <= '1';
			chng <= '1';
		elsif ((internal_state = s17) and (x = '1')) then -- from s11
			disp <= '1';
			chng <= '0';
    else
      disp <= '0';
      chng <= '0';
    end if;

	end process compute_output;

	next_state: process(clk) is
	-- Narrating state progression depending on input
	begin
		if((reset_n = '0') and rising_edge(clk)) then
			internal_state <= s00;
		elsif rising_edge(clk) then
			case internal_state is
				when s00 =>
					if (x = '0') then
						internal_state <= s01;
					else
						internal_state <= s05;
					end if;
				when s01 =>
					if (x = '0') then
						internal_state <= s02;
					else
						internal_state <= s06;
					end if;
				when s02 =>
					if (x = '0') then
						internal_state <= s03;
					else
						internal_state <= s07;
					end if;
				when s03 =>
					if (x = '0') then
						internal_state <= s04;
					else
						internal_state <= s08;
					end if;
        when s04 =>
          if (x = '0') then
            internal_state <= s05;
          else
            internal_state <= s09;
          end if;
        when s05 =>
          if (x = '0') then
            internal_state <= s06;
          else
            internal_state <= s10;
          end if;

        when s06 =>
          if (x = '0') then
            internal_state <= s07;
          else
            internal_state <= s11;
          end if;

        when s07 =>
          if (x = '0') then
            internal_state <= s08;
          else
            internal_state <= s12;
          end if;

        when s08 =>
          if (x = '0') then
            internal_state <= s09;
          else
            internal_state <= s13;
          end if;

        when s09 =>
          if (x = '0') then
            internal_state <= s10;
          else
            internal_state <= s14;
          end if;

        when s10 =>
          if (x = '0') then
            internal_state <= s11;
          else
            internal_state <= s15;
          end if;

        when s11 =>
          if (x = '0') then
            internal_state <= s12;
          else
            internal_state <= s17;
          end if;

        when s12 =>
          if (x = '0') then
            internal_state <= s13;
          else
            internal_state <= s16;
          end if;

        when s13 =>
          if (x = '0') then
            internal_state <= s14;
          else
            internal_state <= s16;
          end if;

        when s14 =>
          if (x = '0') then
            internal_state <= s15;
          else
            internal_state <= s16;
          end if;
        when s15 =>
					if (x = '0') then
						internal_state <= s16;
					else
						internal_state <= s16;
					end if;
				when others =>
					internal_state <= s00;

			end case;

		end if;
	end process next_state;
end architecture main;
