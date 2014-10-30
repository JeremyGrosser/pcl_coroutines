with Generators;

package Support is

   --  Package providing helpers for test programs

   package Int_Generators is new Generators (Integer);
   --  Generators that yield integers. Most tests use them.

   type Counter_Infinity is new Int_Generators.Generator with record
      First : Integer := 0;
      --  First integer to yield
   end record;
   --  Generator that yields an infinite suite of increasing integers

   overriding procedure Generate (C : in out Counter_Infinity);

   type Counter_Finite is new Int_Generators.Generator with record
      Last : Natural := 0;
      --  Last integer to yield
   end record;
   --  Generator that yields a finite suite of increasing integers, starting
   --  with 1.

   overriding procedure Generate (C : in out Counter_Finite);

end Support;