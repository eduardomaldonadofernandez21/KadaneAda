with Kadane; use Kadane;
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure Main is
   --a1 : constant Int_array (1..8) := (-2, -3, 4, -1, -2, 1, 5, -3);
   --Name : constant String := "array.txt";
   --Ver : Int_array(1..1001);
   FileInput : Boolean := False;
   File : constant String := "array.txt";
   Size : Integer ;
begin
   Put_Line("Si necesita ayuda escriba 'main.exe -h'");
   for I in 1 .. Argument_Count loop
      Ada.Text_IO.Put_Line ("Argumento" & Integer'Image (I) & ": " & Argument (I));
      if (Argument(I)(1)) /= '-' then
         --Put_Line(Argument(I));
         --File := "array.txt"; --PROBLEMA
         Size := SizeArray(File); --OJO, si no le ponemos array.txt no se calcula
      end if;
      if "-v" = Argument(I) and FileInput then
         Size := SizeArray(File);
         Put_Line("El tamaño del array es " & Integer'Image(Size));
      end if;
      if "-f" = Argument(I) then
         FileInput := True;
      end if;
      if "-dt" = Argument(I) and FileInput then
         Put_Line ("Tiempo transcurrido: " & Duration'Image(To_Duration (ExecutionTime(ReadSize(File)))) & " segundo");
      end if;
      if "-di" = Argument(I) and FileInput then
         Put_Line("Input Array");
          declare
            arr : constant Int_array (0..SizeArray(File)) := ReadSize(File);
          begin
            for i in arr'Range loop
               if i /= 0 then
                  Put_Line(Integer'Image(arr(I)));
               end if;
            end loop;
          end;
      end if;
      if "-do" = Argument(I) and FileInput then
         Put_Line("Suma contigua maxima es: " & Integer'Image(AlgKadane(ReadSize(File))));
      end if;
      if "-h" = Argument(I) then
         Put_Line("---------------");
         Put_Line("Uso: Main.exe");
         Put_Line("-f [FILE], Fichero de entrada");
         Put_Line("-dt, Mostrar el tiempo de ejecucion del algoritmo en segundos");
         Put_Line("-di, Mostrar el array de entrada al algoritmo");
         Put_Line("-do, Mostrar la suma contigua maxima (Output del algoritmo)");
         Put_Line("-v, Tamaño del array");
         Put_Line("---------------");
      end if;
   end loop;
       Set_Exit_Status (Success);
   exception
   when others =>
      Set_Exit_Status (Failure);
      Put_Line("Este argumento no es valido");

   --Ver := ReadSize(Name);
   --for i in Ver'Range loop
     -- Put_Line(Integer'Image(Ver(i)));
   --end loop;
   --Put_Line("Maximum contiguous sum is" & Integer'Image(AlgKadane(a1)));
   --Put_Line("Elapsed Time: " & Duration'Image(To_Duration (ExecutionTime(a1))) & " seconds");
end Main;
