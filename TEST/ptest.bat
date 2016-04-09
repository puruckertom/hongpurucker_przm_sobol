@Echo On
@Rem Simple installation test of przm
@Rem Execute this batch file from the przm "Test" directory
@Rem Compare the output files against the files in "Test\output"

set Exe="..\Source\przm3123.exe"



md Out_Test
@rem pushD Out_Test
cd Out_Test
del *.* /y
copy ..\input\GA1L_2PA.INP .
copy ..\Input\przm3.run .

Rem Copy the met file
copy ..\Input\met\GA1LEVAP.MET .

przm3123.exe >out.txt 2>&1

@rem popd
cd ..
pause
