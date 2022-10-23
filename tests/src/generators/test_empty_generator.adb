with Ada.Text_IO; use Ada.Text_IO;

with Gen_Support; use Gen_Support;

--  Test declaring a generator and then performing no iteration on it

procedure Test_Empty_Generator is
   G : Int_Generators.Generator :=
     Int_Generators.Create (new Counter_Infinity);
   pragma Unreferenced (G);
begin
   Put_Line ("Doing nothing");
end Test_Empty_Generator;
