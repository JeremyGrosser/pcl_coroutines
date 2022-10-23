with Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;

with Gen_Support; use Gen_Support;

--  Test complete iterations on a generator that yields a specific number of
--  times.

procedure Test_Complete is
   Last : constant Integer :=
     Natural'Value (Ada.Command_Line.Argument (1));
   G : constant Int_Generators.Generator :=
     Int_Generators.Create (new Counter_Finite'(Last => Last));
begin
   for I of G loop
      Put_Line ("Iteration" & Integer'Image (I));
   end loop;
end Test_Complete;
