@ECHO OFF
ECHO Backup.bat %%Computer%% %%Group%%
IF "%1"=="" (
	ECHO The first argument must be the computer to back up.
	GOTO :EOF
)
IF "%2"=="" (
	ECHO The second argument must be the group to back up.
	GOTO :EOF
)
CALL ParseINI.bat "Backup" %1 %2