with Ada.Text_IO; use Ada.Text_IO;
with Ada.Exceptions; use Ada.Exceptions;

with Coroutines; use Coroutines;
with Support; use Support;

--  Test where the completion of a coroutine resumes execution to in a chained
--  scenario.

--  When a coroutine terminates and its creator coroutine is still alive, we
--  expect execution to resume to its creator.

procedure Test_Resume_Chained is

   type Delegate_A is new Delegate with null record;
   overriding procedure Run (D : in out Delegate_A);

   type Delegate_B is new Delegate with null record;
   overriding procedure Run (D : in out Delegate_B);

   ---------
   -- Run --
   ---------

   overriding procedure Run (D : in out Delegate_A) is
      D_B : access Delegate_B := new Delegate_B;
      C_B : Coroutine := Create (Delegate_Access (D_B));
   begin
      Put_Line ("Coroutine A: started, about to spawn B");
      C_B.Spawn;
      C_B.Switch;
      Put_Line ("Coroutine A: about to terminate");
   end Run;

   ---------
   -- Run --
   ---------

   overriding procedure Run (D : in out Delegate_B) is
   begin
      Put_Line ("Coroutine B: started, about to terminate");
   end Run;

   D_A : access Delegate_A := new Delegate_A;
   C_A : Coroutine := Create (Delegate_Access (D_A));
begin
   Put_Line ("Main: about to spawn A");
   C_A.Spawn;
   C_A.Switch;
   Put_Line ("Main: about to terminate");
end Test_Resume_Chained;
