library ieee;
use ieee.std_logic_1164.all;
--q for s0, w for s1, e for cout
entity muxAdder is
  port(
    q01   : in  std_logic;
    q02   : in  std_logic;
    q03   : in  std_logic;
    q04   : in  std_logic;

    w01   : in  std_logic;
    w02  : in  std_logic;
    w03  : in  std_logic;
    w04  : in  std_logic;
    w05  : in  std_logic;
    w06   : in  std_logic;
    w07  : in  std_logic;
    w08  : in  std_logic;
    w09  : in  std_logic;
    w10  : in  std_logic;
    w11  : in  std_logic;
    w12  : in  std_logic;
    w13  : in  std_logic;
    w14  : in  std_logic;
    w15  : in  std_logic;
    w16  : in  std_logic;

    e01   : in  std_logic;
    e02   : in  std_logic;
    e03   : in  std_logic;
    e04   : in  std_logic;
    e05   : in  std_logic;
    e06   : in  std_logic;
    e07   : in  std_logic;
    e08   : in  std_logic;
    e09   : in  std_logic;
    e10   : in  std_logic;
    e11   : in  std_logic;
    e12   : in  std_logic;
    e13   : in  std_logic;
    e14   : in  std_logic;
    e15   : in  std_logic;
    e16   : in  std_logic;

    a1    : in  std_logic;
    a0    : in  std_logic;
    b1    : in  std_logic;
    b0    : in  std_logic;

    cout  : out  std_logic;
    s1    : out  std_logic;
    s0    : out std_logic);
end muxAdder;

architecture IF_STATEMENT of mux2bitfulladder is
begin

  process(a1, a0, b1, b0
          q01, q02, q03, q04
          w01, w02, w03, w04, w05, w06, w07, w08, w09, w10, w11, w12, w13, w14, w15, w16
          e01, e02, e03, e04, e05, e06, e07, e08, e09, e10, e11, e12, e13, e14, e15, e16)
  begin
    if    (a1 = '0') and (a0 = '0') and (b1 = '0') and (b0 = '0') then
			s0 <= q01;
      s1 <= w01;
      cout <= e01;
	  elsif (a1 = '0') and (a0 = '0') and (b1 = '0') and (b0 = '1') then
			s0 <= q02;
      s1 <= w02;
      cout <= e02;
	  elsif (a1 = '0') and (a0 = '0') and (b1 = '1') and (b0 = '0') then
			s0 <= q01;
      s1 <= w03;
      cout <= e03;
    elsif (a1 = '0') and (a0 = '0') and (b1 = '1') and (b0 = '1') then
			s0 <= q02;
      s1 <= w04;
      cout <= e04;
    elsif (a1 = '0') and (a0 = '1') and (b1 = '0') and (b0 = '0') then
			s0 <= q03;
      s1 <= w05;
      cout <= e05;
    elsif (a1 = '0') and (a0 = '1') and (b1 = '0') and (b0 = '1') then
			s0 <= q04;
      s1 <= w06;
      cout <= e06;
    elsif (a1 = '0') and (a0 = '1') and (b1 = '1') and (b0 = '0') then
			s0 <= q03;
      s1 <= w07;
      cout <= e07;
    elsif (a1 = '0') and (a0 = '1') and (b1 = '1') and (b0 = '1') then
			s0 <= q04;
      s1 <= w08;
      cout <= e08;
    elsif (a1 = '1') and (a0 = '0') and (b1 = '0') and (b0 = '0') then
			s0 <= q01;
      s1 <= w09;
      cout <= e09;
    elsif (a1 = '1') and (a0 = '0') and (b1 = '0') and (b0 = '1') then
			s0 <= q02;
      s1 <= w10;
      cout <= e10;
    elsif (a1 = '1') and (a0 = '0') and (b1 = '1') and (b0 = '0') then
			s0 <= q01;
      s1 <= w11;
      cout <= e11;
    elsif (a1 = '1') and (a0 = '0') and (b1 = '1') and (b0 = '1') then
			s0 <= q02;
      s1 <= w12;
      cout <= e12;
    elsif (a1 = '1') and (a0 = '1') and (b1 = '0') and (b0 = '0') then
			s0 <= q03;
      s1 <= w13;
      cout <= e13;
    elsif (a1 = '1') and (a0 = '1') and (b1 = '0') and (b0 = '1') then
			s0 <= q04;
      s1 <= w14;
      cout <= e14;
    elsif (a1 = '1') and (a0 = '1') and (b1 = '1') and (b0 = '0') then
			s0 <= q03;
      s1 <= w15;
      cout <= e15;
    elsif (a1 = '1') and (a0 = '1') and (b1 = '1') and (b0 = '1') then
			s0 <= q04;
      s1 <= w16;
      cout <= e16;
    end if;
  end process;
end IF_STATEMENT1;
