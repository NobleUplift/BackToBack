@ECHO OFF
REM Backup or Restore
ECHO COMMAND: %1
REM The subcommand
ECHO SUBCOMMAND: %2
REM The computer to backup
ECHO COMPUTER: %3
REM The directory to backup
ECHO DIRECTORY: %4
REM The date
ECHO DATE: %5
REM The backup destination
ECHO DESTINATION: %6
REM The username
ECHO USERNAME: %7
REM The password
ECHO PASSWORD: %8

REM FOR /F "tokens=* delims=" %%A IN ('DATE/T') DO SET DATE=%%A
REM SET DATE=%DATE:~0,10%

REM %%1 is the source directory.
REM %%2 is the root directory of the backups.
REM %%3 is the relative path to backup to.
IF %1==Backup (
    ECHO RUNNING BACKUP: %1%2.bat "%~4" "%~d0\%~3\%5" "%~p4%~nx4"
    %1%2.bat "%~4" "%~d0\%~3\%5" "%~p4%~nx4"
)
IF %1==Snapshot (
    ECHO RUNNING SNAPSHOT: %1%2.bat "%~4" "%3" "%~p4%~nx4"
    %1%2.bat "%~4" "%3" "%~p4%~nx4" %6 %7 %8
)