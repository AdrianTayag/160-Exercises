-- for s0 output only

library ieee;
use ieee.std_logic_1164.all;

entity muxAdder is
  port(
    a0    : in  std_logic;
    b0    : in  std_logic;
    cin   : in  std_logic;
    s0    : out std_logic);
end muxAdder;

-- Concurrent statement examples. Concurrent statements are not part of a
-- process and are executed anytime one of their inputs changes.

architecture IF_STATEMENT1 of muxAdder is
begin

  process(a0, b0, cin)
  begin
    -- if statement is pretty straightforward.
    if (a0 = '0') and (b0 = '0') then
			s0 <= cin;
	  elsif (a0 = '0') and (b0 = '1') then
			s0 <= not(cin);
	  elsif (a0 = '1') and (b0 = '0') then
			s0 <= not(cin);
    elsif (a0 = '1') and (b0 = '1') then
			s0 <= cin;
    end if;
  end process;
end IF_STATEMENT1;
