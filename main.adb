with Kadane; use Kadane;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;


procedure Main is
   a1 : constant Int_array (1..8) := (-2, -3, 4, -1, -2, 1, 5, -3);
   Name : constant String := "array.txt";
   Ver : Boolean;
begin
   Ver := ReadSize(Name);
   --Put_Line("Maximum contiguous sum is" & Integer'Image(AlgKadane(a1)));
   Put_Line("Elapsed Time: " & Duration'Image(To_Duration (ExecutionTime(a1))) & " seconds");
end Main;
