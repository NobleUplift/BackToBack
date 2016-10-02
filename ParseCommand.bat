@ECHO OFF
REM ECHO COMMAND: %1
REM ECHO SUBCOMMAND: %2
REM ECHO COMPUTER: %3
REM ECHO DIRECTORY: %4
REM ECHO VERSION: %5
REM ECHO DESTINATION: %6
REM ECHO USERNAME: %7
REM ECHO PASSWORD: %8

REM FOR /F "tokens=* delims=" %%A IN ('DATE/T') DO SET DATE=%%A
REM SET DATE=%DATE:~0,10%

REM %%1 is the source directory.
REM %%2 is the root directory of the backups.
REM %%3 is the relative path to backup to.
IF %~1==Backup (
	REM ~d gets the drive letter w/ colon
	REM ~p gets path and ~nx gets filename + extension, splitting out drive letter
	REM ECHO %~1%~2.bat "%~4" "%~d0\%~3\%5" "%~p4%~nx4"
	%~1%~2.bat "%~4" "%~d0\%~3\%5" "%~p4%~nx4"
)
IF %~1==Snapshot (
	REM ~p gets path and ~nx gets filename + extension, splitting out drive letter
	REM ECHO %~1%~2.bat "%~4" "%~3" "%~p4%~nx4" %~6 %~7 %8
	%~1%~2.bat "%~4" "%~3" "%~p4%~nx4" %~6 %~7 %8
)

IF %~1==Restore (
	REM ~p gets path and ~nx gets filename + extension, splitting out drive letter
	REM ECHO %~1%~2.bat "%~4" "%~3" "%~p4%~nx4" "%~5" "%~6" "%~7" "%~8"
	%~1%~2.bat "%~4" "%~3" "%~p4%~nx4" "%~5" "%~6" "%~7" "%~8"
)
