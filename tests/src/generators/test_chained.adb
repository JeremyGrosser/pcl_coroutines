with Ada.Text_IO; use Ada.Text_IO;

with Gen_Support; use Gen_Support;

--  Test creating generators from another generator

procedure Test_Chained is
   G1 : constant Int_Generators.Generator :=
     Int_Generators.Create (new Counter_Finite'(Last => 5));
   G2 : constant Int_Generators.Generator :=
     Int_Generators.Create (new Doubles'(G => G1));
begin
   for I of G2 loop
      Put_Line (Integer'Image (I));
   end loop;
end Test_Chained;
