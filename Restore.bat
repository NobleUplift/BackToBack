@ECHO OFF
ECHO Restore.bat %%Computer%% %%Group%% %%Version%% %%Hostname%% %%Username%% %%Password%%
IF "%1"=="" (
	ECHO The first argument must be the computer to restore.
	GOTO :EOF
)
IF "%2"=="" (
	ECHO The second argument must be the group to restore.
	GOTO :EOF
)
IF "%3"=="" (
	ECHO The third argument must be the date or snapshot to restore.
	GOTO :EOF
)
ParseINI.bat "Restore" %1 %2 %3 %4 %5 %6
