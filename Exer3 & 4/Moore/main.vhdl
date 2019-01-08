library IEEE;
use IEEE.std_logic_1164.all;

-- declaring all possible states of the fsm
package STATE_CONSTANTS is
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

library IEEE;
use IEEE.std_logic_1164.all;
use work.STATE_CONSTANTS.all;

entity main is
	port (disp: out std_logic;
        chng: out std_logic;
			  state: out std_logic_vector(STATE_BITS-1 downto 0);
			  reset_n: in std_logic;
			  clk: in std_logic;
			  x: in std_logic);
end entity main;

architecture main of main is

	signal internal_state: std_logic_vector(STATE_BITS-1 downto 0);

	begin

		state <= internal_state;

		form_output: process(internal_state) is
		begin --only comprises of 3 possible state outputs.
			case internal_state is
				when S16 =>
        disp <= '1';
        chng <= '0';
        when S17 =>
        disp <= '1';
        chng <= '1';
				when others =>
        disp <= '0';
        chng <= '0';
			end case;
		end process form_output;

		next_state: process(reset_n, clk) is
		begin --listing state transition possibilities.
			if (reset_n = '0') then
				internal_state <= S00;
			elsif rising_edge(clk) then
				case internal_state is
					when S00 =>
						if (x = '1') then
							internal_state <= S05;
						else
							internal_state <= S01;
						end if;
					when S01 =>
						if (x = '1') then
							internal_state <= S06;
            else
              internal_state <= S02;
						end if;
          when S02 =>
  					if (x = '1') then
  						internal_state <= S07;
            else
              internal_state <= S03;
						end if;
          when S03 =>
    				if (x = '1') then
    					internal_state <= S08;
            else
              internal_state <= S04;
						end if;
          when S04 =>
    				if (x = '1') then
    					internal_state <= S09;
            else
              internal_state <= S05;
						end if;
          when S05 =>
    				if (x = '1') then
    					internal_state <= S10;
            else
              internal_state <= S06;
						end if;
          when S06 =>
    				if (x = '1') then
    					internal_state <= S11;
            else
              internal_state <= S07;
						end if;
          when S07 =>
    				if (x = '1') then
    					internal_state <= S12;
            else
              internal_state <= S08;
						end if;
          when S08 =>
    				if (x = '1') then
    					internal_state <= S13;
            else
              internal_state <= S09;
						end if;
          when S09 =>
    				if (x = '1') then
    					internal_state <= S14;
            else
              internal_state <= S10;
						end if;
          when S10 =>
    				if (x = '1') then
    					internal_state <= S15;
            else
              internal_state <= S11;
						end if;
          when S11 =>
    				if (x = '1') then
    					internal_state <= S16;
            else
              internal_state <= S12;
						end if;
          when S12 =>
    				if (x = '1') then
    					internal_state <= S17;
            else
              internal_state <= S13;
						end if;
          when S13 =>
    				if (x = '1') then
    					internal_state <= S17;
            else
              internal_state <= S14;
						end if;
          when S14 =>
    				if (x = '1') then
    					internal_state <= S17;
            else
              internal_state <= S15;
						end if;
          when S15 =>
    				if (x = '1') then
    					internal_state <= S17;
            else
              internal_state <= S16;
						end if;
          when S16 =>
            if (x = '1') then
              internal_state <= S05;
            else
              internal_state <= S01;
            end if;
          when S17 =>
            if (x = '1') then
              internal_state <= S05;
            else
              internal_state <= S02;
            end if;


					when others => internal_state <= "XXXXX";
				end case;
			end if;
		end process next_state;

	end architecture main;
