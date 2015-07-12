@ECHO OFF
REM Backup or Restore
REM ECHO COMMAND: %1
REM The subcommand
REM ECHO SUBCOMMAND: %2
REM The computer to backup
REM ECHO COMPUTER: %3
REM The directory to backup
REM ECHO DIRECTORY: %4
REM The date
REM ECHO DATE: %5
REM The backup destination
REM ECHO DESTINATION: %6
REM The username
REM ECHO USERNAME: %7
REM The password
REM ECHO PASSWORD: %8

REM FOR /F "tokens=* delims=" %%A IN ('DATE/T') DO SET DATE=%%A
REM SET DATE=%DATE:~0,10%

REM %%1 is the source directory.
REM %%2 is the root directory of the backups.
REM %%3 is the relative path to backup to.
IF %1==Backup (
    REM ECHO RUNNING BACKUP: %1%2.bat "%~4" "%~d0\%~3\%5" "%~p4%~nx4"
    %1%2.bat "%~4" "%~d0\%~3\%5" "%~p4%~nx4"
)
IF %1==Snapshot (
    REM ECHO RUNNING SNAPSHOT: %1%2.bat "%~4" "%3" "%~p4%~nx4"
    %1%2.bat "%~4" "%3" "%~p4%~nx4" %6 %7 %8
)