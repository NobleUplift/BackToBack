@ECHO OFF
NET USE \\%4\%~2 /u:%4\%5 %6
SETLOCAL ENABLEDELAYEDEXPANSION
SET FROM=%~dp1
FOR %%R IN ("%~2%~3") DO (
	SET TO=%%~dpR
	SET FILENAME=%%~nxR
	SET CMDLINE="!FROM!" "\\%4\%~2\SNAPSHOT\%~p3" "!FILENAME!"
	REM ECHO ROBOCOPY !CMDLINE:\"="!
	ROBOCOPY !CMDLINE:\"="! /COPYALL /SL
)
ENDLOCAL