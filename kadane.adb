with Ada.Text_IO; use Ada.Text_IO;

package body Kadane is
   --Función para medir el tiempo ejecutado del algoritmo
   function ExecutionTime(A : Int_array) return Time_Span is
      Start_Time, Stop_Time : Time;
      ElapsedTime : Time_Span;
      Res : Integer := 0;
   begin
      Start_Time := Clock;
      Res := AlgKadane(A);
      Stop_Time := Clock;
      ElapsedTime := Stop_Time - Start_Time;
      return ElapsedTime;
   end ExecutionTime;

   --Algoritmo de Kadane (Maximum subarray problem)
   function AlgKadane(A : Int_array) return Integer is
      maxSoFar : Integer := 0;
      maxEndingHere : Integer := 0;
   begin
      for i in A'Range loop
         maxEndingHere := maxEndingHere + A(i);
         maxEndingHere := Integer'Max(maxEndingHere,0);
         maxSoFar := Integer'Max(maxSoFar,maxEndingHere);
      end loop;
      return maxSoFar;
   end AlgKadane;

   --Función para leer el tamaño del array para crear dicho array de ese tamaño
   function ReadSize(File : String) return Int_array is
      F : File_Type;
      size : Integer;
   begin
      Open(F, In_File, File);
      size := Integer'Value (Get_Line(F));
      --Put_Line(Integer'Image(size));
      --Put_Line("-------------------");
      Close (F);
      return ReadArray(File,size);
   end ReadSize;

   --Función auxiliar para crear el Array que se le pasará al algoritmo
   function ReadArray(File : String; N : Integer) return Int_array is
      res : Int_array (0..N);
      cont : Natural := 0;
      F : File_Type;
   begin
      Open(F, In_File, File);
      while not End_Of_File (F) loop
         res(cont) := Integer'Value (Get_Line(F));
         cont := cont + 1;
      end loop;
      Close (F);
      return res;
   end ReadArray;

   function SizeArray(File : String) return Integer is
      size : Integer;
      F : File_Type;
   begin
      Open(F, In_File, File);
      size := Integer'Value (Get_Line(F));
      Close(F);
      return size;
   end SizeArray;

end Kadane;

