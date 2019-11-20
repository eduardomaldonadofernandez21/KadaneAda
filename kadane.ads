with Ada.Real_Time; use Ada.Real_Time;
with Ada.Execution_Time; use Ada.Execution_Time;

package Kadane is

   type Int_array is array (Integer range <>) of Integer;

   function ExecutionTime(A : Int_array) return Time_Span;
   function AlgKadane(A : Int_array) return Integer;
   function ReadSize(File : String) return Int_array;
   function ReadArray(File : String; N : Integer) return Int_array;
   function SizeArray(File : String) return Integer;

end Kadane;
