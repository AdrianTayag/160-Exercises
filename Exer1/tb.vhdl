entity tb is
end tb;

architecture behav of tb is
   --  Declaration of the component that will be instantiated.
   component main
     port (bin, x1, x0, y1, y0 : in bit; s, d1, d0 : out bit);
   end component;
   --  Specifies which entity is bound with the component.
   for ag: main use entity work.main;
   signal bin, x1, x0, y1, y0, s, d1, d0 : bit;

begin
   --  Component instantiation.
   ag: main port map (
   bin => bin,
   x1 => x1,
   x0 => x0,
   y1 => y1,
   y0 => y0,
   s => s,
   d1 => d1,
   d0 => d0
   );

   --  This process does the real job.
   process
      type pattern_type is record
         --  The inputs of the subtractor.
         bin, x1, x0, y1, y0 : bit;
         --  The expected outputs of the subtractor.
         s, d1, d0 : bit;
      end record;

      --  The patterns to apply.
      type pattern_array is array (natural range <>) of pattern_type;
      constant patterns : pattern_array :=
         (
         ('0', '0', '0', '0', '0', '0', '0', '0'),
         ('0', '0', '0', '0', '1', '1', '1', '1'),
         ('0', '0', '0', '1', '0', '1', '1', '0'),
         ('0', '0', '0', '1', '1', '1', '0', '1'),
         ('0', '0', '1', '0', '0', '0', '0', '1'),
         ('0', '0', '1', '0', '1', '0', '0', '0'),
         ('0', '0', '1', '1', '0', '1', '1', '1'),
         ('0', '0', '1', '1', '1', '1', '1', '0'),
         ('0', '1', '0', '0', '0', '0', '1', '0'),
         ('0', '1', '0', '0', '1', '0', '0', '1'),
         ('0', '1', '0', '1', '0', '0', '0', '0'),
         ('0', '1', '0', '1', '1', '1', '1', '1'),
         ('0', '1', '1', '0', '0', '0', '1', '1'),
         ('0', '1', '1', '0', '1', '0', '1', '0'),
         ('0', '1', '1', '1', '0', '0', '0', '1'),
         ('0', '1', '1', '1', '1', '0', '0', '0'),
         ('1', '0', '0', '0', '0', '1', '1', '1'),
         ('1', '0', '0', '0', '1', '1', '1', '0'),
         ('1', '0', '0', '1', '0', '1', '0', '1'),
         ('1', '0', '0', '1', '1', '1', '0', '0'),
         ('1', '0', '1', '0', '0', '0', '0', '0'),
         ('1', '0', '1', '0', '1', '1', '1', '1'),
         ('1', '0', '1', '1', '0', '1', '1', '0'),
         ('1', '0', '1', '1', '1', '1', '0', '1'),
         ('1', '1', '0', '0', '0', '0', '0', '1'),
         ('1', '1', '0', '0', '1', '0', '0', '0'),
         ('1', '1', '0', '1', '0', '1', '1', '1'),
         ('1', '1', '0', '1', '1', '1', '1', '0'),
         ('1', '1', '1', '0', '0', '0', '1', '0'),
         ('1', '1', '1', '0', '1', '0', '0', '1'),
         ('1', '1', '1', '1', '0', '0', '0', '0'),
         ('1', '1', '1', '1', '1', '1', '1', '1')
         );

   begin
      --  Check each pattern.
      for i in patterns'range loop
         --  Set the inputs.
         bin <= patterns(i).bin;
         x1 <= patterns(i).x1;
         x0 <= patterns(i).x0;
         y1 <= patterns(i).y1;
         y0 <= patterns(i).y0;
         --  Wait for the results.
         wait for 1 ns;
         --  Check the outputs.
         assert s = patterns(i).s report "bad sign bit value" severity error;
         assert d1 = patterns(i).d1 report "bad d1 value" severity error;
         assert d0 = patterns(i).d0 report "bad d0 value" severity error;
      end loop;

      assert false report "mabuhay!" severity note;
      --  Wait forever; this will finish the simulation.
      wait;
   end process;
end behav;
