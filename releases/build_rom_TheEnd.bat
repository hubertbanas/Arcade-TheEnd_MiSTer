@echo off

set    zip=theend.zip
set ifiles=ic13_1t.bin+ic14_2t.bin+ic15_3t.bin+ic16_4t.bin+ic17_5t.bin+ic18_6t.bin+ ic18_6t.bin+ic18_6t.bin+ic31_1c.bin+ic30_2c.bin+ic56_1.bin+ic55_2.bin+ic56_1.bin
set  ofile=a.theend.rom

rem =====================================
setlocal ENABLEDELAYEDEXPANSION

set pwd=%~dp0
echo.
echo.

if EXIST %zip% (

	!pwd!7za x -otmp %zip%
	if !ERRORLEVEL! EQU 0 ( 
		cd tmp

		copy /b/y %ifiles% !pwd!%ofile%
		if !ERRORLEVEL! EQU 0 ( 
			echo.
			echo ** done **
			echo.
			echo Copy "%ofile%" into root of SD card
		)
		cd !pwd!
		rmdir /s /q tmp
	)

) else (

	echo Error: Cannot find "%zip%" file
	echo.
	echo Put "%zip%", "7za.exe" and "%~nx0" into the same directory
)

echo.
echo.
pause
