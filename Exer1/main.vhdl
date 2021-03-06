-- This is a full 2 bit subtractor


entity main is
  -- Defining inputs and outputs using 'port' function
  port (bin, x1, x0, y1, y0 : in bit; s, d1, d0 : out bit);
end main;

architecture rtl of main is
-- Defining intermediate variables for solving
signal bin0 : bit;
begin
  -- Logic of the program goes here
  d0 <= bin xor (x0 xor y0);
  bin0 <= (not(x0) and y0) or (not(x0 xor y0) and bin);
  d1 <= bin0 xor (x1 xor y1);
  s <= (not(x1) and y1) or (not(x1 xor y1) and bin0);
end rtl;
