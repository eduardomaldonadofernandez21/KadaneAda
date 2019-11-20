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
      delay 0.8;
      return maxSoFar;
   end AlgKadane;

   --Función para leer el tamaño del array para crear dicho array de ese tamaño
   function ReadSize(File : String) return Boolean is
      F : File_Type;
      size : Integer;
     -- isTam : Boolean := True;
   begin
      Open(F, In_File, File);
      while not End_Of_File (F) loop
         Put_Line (Get_Line (F));
         --if isTam = True then
            size := Integer'Value (Get_Line(F));
            --isTam := False;
         --end if;
      end loop;
      Close (F);

      return true;
   end ReadSize;


   function ReadArray(File : String; N : Integer) return Int_array is
      res : Int_array (1..N);
      cont : Natural := 0;
      F : File_Type;
   begin
      Open(F, In_File, File);
      while not End_Of_File (F) loop
         if cont /= 0  then
            Put_Line (Get_Line (F));
            res(cont) := Integer'Value (Get_Line(F));
         end if;
         cont := cont + 1;
      end loop;
      Close (F);
      return res;
   end ReadArray;

end Kadane;
