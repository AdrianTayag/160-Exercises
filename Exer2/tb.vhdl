entity mux2bitfulladdertb is
end mux2bitfulladdertb;

architecture tb of mux2bitfulladdertb is

component mux2bitfulladder
  port(
  q01  : in  std_logic;
  q02  : in  std_logic;
  q03  : in  std_logic;
  q04  : in  std_logic;

  w01  : in  std_logic;
  w02  : in  std_logic;
  w03  : in  std_logic;
  w04  : in  std_logic;
  w05  : in  std_logic;
  w06  : in  std_logic;
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

  e01  : in  std_logic;
  e02  : in  std_logic;
  e03  : in  std_logic;
  e04  : in  std_logic;
  e05  : in  std_logic;
  e06  : in  std_logic;
  e07  : in  std_logic;
  e08  : in  std_logic;
  e09  : in  std_logic;
  e10  : in  std_logic;
  e11  : in  std_logic;
  e12  : in  std_logic;
  e13  : in  std_logic;
  e14  : in  std_logic;
  e15  : in  std_logic;
  e16  : in  std_logic;

  a1   : in  std_logic;
  a0   : in  std_logic;
  b1   : in  std_logic;
  b0   : in  std_logic;

  cout : out  std_logic;
  s1   : out  std_logic;
  s0   : out std_logic);
  end component;

  signal q01  : std_logic;
  signal q02  : std_logic;
  signal q03  : std_logic;
  signal q04  : std_logic;

  signal w01  : std_logic;
  signal w02  : std_logic;
  signal w03  : std_logic;
  signal w04  : std_logic;
  signal w05  : std_logic;
  signal w06  : std_logic;
  signal w07  : std_logic;
  signal w08  : std_logic;
  signal w09  : std_logic;
  signal w10  : std_logic;
  signal w11  : std_logic;
  signal w12  : std_logic;
  signal w13  : std_logic;
  signal w14  : std_logic;
  signal w15  : std_logic;
  signal w16  : std_logic;

  signal e01  : std_logic;
  signal e02  : std_logic;
  signal e03  : std_logic;
  signal e04  : std_logic;
  signal e05  : std_logic;
  signal e06  : std_logic;
  signal e07  : std_logic;
  signal e08  : std_logic;
  signal e09  : std_logic;
  signal e10  : std_logic;
  signal e11  : std_logic;
  signal e12  : std_logic;
  signal e13  : std_logic;
  signal e14  : std_logic;
  signal e15  : std_logic;
  signal e16  : std_logic;

  signal a1   : std_logic;
  signal a0   : std_logic;
  signal b1   : std_logic;
  signal b0   : std_logic;

  signal cout : std_logic;
  signal s1   : std_logic;
  signal s0   : std_logic);

begin

  test : entity work.mux2mux2bitfulladder(IF_STATEMENT)
    port map (
    q01 => q01,
    q02 => q02,
    q03 => q03,
    q04 => q04,

    w01 => w01,
    w02 => w02,
    w03 => w03,
    w04 => w04,
    w05 => w05,
    w06 => w06,
    w07 => w07,
    w08 => w08,
    w09 => w09,
    w10 => w10,
    w11 => w11,
    w12 => w12,
    w13 => w13,
    w14 => w14,
    w15 => w15,
    w16 => w16,

    e01 => e01,
    e02 => e02,
    e03 => e03,
    e04 => e04,
    e05 => e05,
    e06 => e06,
    e07 => e07,
    e08 => e08,
    e09 => e09,
    e10 => e10,
    e11 => e11,
    e12 => e12,
    e13 => e13,
    e14 => e14,
    e15 => e15,
    e16 => e16);

    process
      variable temp : std_logic_vector(2 downto 0);

    function to_std_logic(i : in integer) return std_logic is
    begin
      if i = 0 then
        return '0';
      else
        return '1';
      end if;
    end to_std_logic;

  function mux_testCout (
    signal e01 : std_logic;
    signal e02 : std_logic;
    signal e03 : std_logic;
    signal e04 : std_logic;
    signal e05 : std_logic;
    signal e06 : std_logic;
    signal e07 : std_logic;
    signal e08 : std_logic;
    signal e09 : std_logic;
    signal e10 : std_logic;
    signal e11 : std_logic;
    signal e12 : std_logic;
    signal e13 : std_logic;
    signal e14 : std_logic;
    signal e15 : std_logic;
    signal e16 : std_logic;
    signal a1 : std_logic;
    signal a0  : std_logic;
    signal b1  : std_logic;
    signal b0  : std_logic)
    return std_logic is

  begin
    if    (a1 = '0') and (a0 = '0') and (b1 = '0') and (b0 = '0') then
      return e01;
    elsif (a1 = '0') and (a0 = '0') and (b1 = '0') and (b0 = '1') then
      return e02;
    elsif (a1 = '0') and (a0 = '0') and (b1 = '1') and (b0 = '0') then
      return e03;
    elsif (a1 = '0') and (a0 = '0') and (b1 = '1') and (b0 = '1') then
      return e04;
    elsif (a1 = '0') and (a0 = '1') and (b1 = '0') and (b0 = '0') then
      return e05;
    elsif (a1 = '0') and (a0 = '1') and (b1 = '0') and (b0 = '1') then
      return e06;
    elsif (a1 = '0') and (a0 = '1') and (b1 = '1') and (b0 = '0') then
      return e07;
    elsif (a1 = '0') and (a0 = '1') and (b1 = '1') and (b0 = '1') then
      return e08;
    elsif (a1 = '1') and (a0 = '0') and (b1 = '0') and (b0 = '0') then
      return e09;
    elsif (a1 = '1') and (a0 = '0') and (b1 = '0') and (b0 = '1') then
      return e10;
    elsif (a1 = '1') and (a0 = '0') and (b1 = '1') and (b0 = '0') then
      return e11;
    elsif (a1 = '1') and (a0 = '0') and (b1 = '1') and (b0 = '1') then
      return e12;
    elsif (a1 = '1') and (a0 = '1') and (b1 = '0') and (b0 = '0') then
      return e13;
    elsif (a1 = '1') and (a0 = '1') and (b1 = '0') and (b0 = '1') then
      return e14;
    elsif (a1 = '1') and (a0 = '1') and (b1 = '1') and (b0 = '0') then
      return e15;
    elsif (a1 = '1') and (a0 = '1') and (b1 = '1') and (b0 = '1') then
      return e16;
    end if;
  end mux_testCout;

  function mux_testS1 (
    signal w01 : std_logic;
    signal w02 : std_logic;
    signal w03 : std_logic;
    signal w04 : std_logic;
    signal w05 : std_logic;
    signal w06 : std_logic;
    signal w07 : std_logic;
    signal w08 : std_logic;
    signal w09 : std_logic;
    signal w10 : std_logic;
    signal w11 : std_logic;
    signal w12 : std_logic;
    signal w13 : std_logic;
    signal w14 : std_logic;
    signal w15 : std_logic;
    signal w16 : std_logic;
    signal a1 : std_logic;
    signal a0  : std_logic;
    signal b1  : std_logic;
    signal b0  : std_logic)
    return std_logic is

  begin
    if    (a1 = '0') and (a0 = '0') and (b1 = '0') and (b0 = '0') then
      return w01;
    elsif (a1 = '0') and (a0 = '0') and (b1 = '0') and (b0 = '1') then
      return w02;
    elsif (a1 = '0') and (a0 = '0') and (b1 = '1') and (b0 = '0') then
      return w03;
    elsif (a1 = '0') and (a0 = '0') and (b1 = '1') and (b0 = '1') then
      return w04;
    elsif (a1 = '0') and (a0 = '1') and (b1 = '0') and (b0 = '0') then
      return w05;
    elsif (a1 = '0') and (a0 = '1') and (b1 = '0') and (b0 = '1') then
      return w06;
    elsif (a1 = '0') and (a0 = '1') and (b1 = '1') and (b0 = '0') then
      return w07;
    elsif (a1 = '0') and (a0 = '1') and (b1 = '1') and (b0 = '1') then
      return w08;
    elsif (a1 = '1') and (a0 = '0') and (b1 = '0') and (b0 = '0') then
      return w09;
    elsif (a1 = '1') and (a0 = '0') and (b1 = '0') and (b0 = '1') then
      return w10;
    elsif (a1 = '1') and (a0 = '0') and (b1 = '1') and (b0 = '0') then
      return w11;
    elsif (a1 = '1') and (a0 = '0') and (b1 = '1') and (b0 = '1') then
      return w12;
    elsif (a1 = '1') and (a0 = '1') and (b1 = '0') and (b0 = '0') then
      return w13;
    elsif (a1 = '1') and (a0 = '1') and (b1 = '0') and (b0 = '1') then
      return w14;
    elsif (a1 = '1') and (a0 = '1') and (b1 = '1') and (b0 = '0') then
      return w15;
    elsif (a1 = '1') and (a0 = '1') and (b1 = '1') and (b0 = '1') then
      return w16;
    end if;
  end mux_testS1;

    function mux_testS0 (
      signal q01 : std_logic;
      signal q02 : std_logic;
      signal q03 : std_logic;
      signal q04 : std_logic;
      signal a1  : std_logic;
      signal a0  : std_logic;
      signal b1  : std_logic;
      signal b0  : std_logic)
      return std_logic is

    begin
      if    (a1 = '0') and (a0 = '0') and (b1 = '0') and (b0 = '0') then
  			return q01;
  	  elsif (a1 = '0') and (a0 = '0') and (b1 = '0') and (b0 = '1') then
  			return q02;
  	  elsif (a1 = '0') and (a0 = '0') and (b1 = '1') and (b0 = '0') then
  			return q01;
      elsif (a1 = '0') and (a0 = '0') and (b1 = '1') and (b0 = '1') then
  			return q02;
      elsif (a1 = '0') and (a0 = '1') and (b1 = '0') and (b0 = '0') then
  			return q03;
      elsif (a1 = '0') and (a0 = '1') and (b1 = '0') and (b0 = '1') then
  			return q04;
      elsif (a1 = '0') and (a0 = '1') and (b1 = '1') and (b0 = '0') then
  			return q03;
      elsif (a1 = '0') and (a0 = '1') and (b1 = '1') and (b0 = '1') then
  			return q04;
      elsif (a1 = '1') and (a0 = '0') and (b1 = '0') and (b0 = '0') then
  			return q01;
      elsif (a1 = '1') and (a0 = '0') and (b1 = '0') and (b0 = '1') then
  			return q02;
      elsif (a1 = '1') and (a0 = '0') and (b1 = '1') and (b0 = '0') then
  			return q01;
      elsif (a1 = '1') and (a0 = '0') and (b1 = '1') and (b0 = '1') then
  			return q02;
      elsif (a1 = '1') and (a0 = '1') and (b1 = '0') and (b0 = '0') then
  			return q03;
      elsif (a1 = '1') and (a0 = '1') and (b1 = '0') and (b0 = '1') then
  			return q04;
      elsif (a1 = '1') and (a0 = '1') and (b1 = '1') and (b0 = '0') then
  			return q03;
      elsif (a1 = '1') and (a0 = '1') and (b1 = '1') and (b0 = '1') then
  			return q04;
      end if;
    end mux_testS0;

    begin
      for i in 0 to 15 loop
        temp := std_logic_vector(to_unsigned(i, 3));
        a1 <= temp(2);
        a0 <= temp(2);
        b1 <= temp(2);
        b0 <= temp(2);

        q01 <= temp(0);
        q02 <= not temp(0);
        q03 <= not temp(0);
        q04 <= temp(0);

        w01 <= to_std_logic(0);
        w02 <= temp(0);
        w03 <= to_std_logic(1);
        w04 <= not temp(0);
        w05 <= temp(0);
        w06 <= to_std_logic(1);
        w07 <= not temp(0);
        w08 <= to_std_logic(0);
        w09 <= to_std_logic(1);
        w10 <= not temp(0);
        w11 <= to_std_logic(0);
        w12 <= temp(0);
        w13 <= not temp(0);
        w14 <= to_std_logic(0);
        w15 <= temp(0);
        w16 <= to_std_logic(1);

        e01 <= to_std_logic(0);
        e02 <= to_std_logic(0);
        e03 <= to_std_logic(0);
        e04 <= temp(0);
        e05 <= to_std_logic(0);
        e06 <= to_std_logic(0);
        e07 <= temp(0);
        e08 <= to_std_logic(1);
        e09 <= to_std_logic(0);
        e10 <= temp(0);
        e11 <= to_std_logic(1);
        e12 <= to_std_logic(1);
        e13 <= temp(0);
        e14 <= to_std_logic(1);
        e15 <= to_std_logic(1);
        e16 <= to_std_logic(1);

        wait for 1 ms;

        assert(Cout = mux_testCout(e01, e02, e03, e04, e05, e06, e07, e08, e09, e10, e11, e12, e13, e14, e15, e16, a1, a0, b1, b0))
          report "Error : Cout incorrect" severity warning;
        assert(s1 = mux_testS1(w01, w02, w03, w04, w05, w06, w07, w08, w09, w10, w11, w12, w13, w14, w15, w16, a1, a0, b1, b0))
          report "Error : S1 incorrect" severity warning;
        assert(s0 = mux_testS0(q01, q02, q03, q04, a1, a0, b1, b0))
          report "Error : S0 incorrect" severity warning;
      end loop;

      wait;

    end process;
