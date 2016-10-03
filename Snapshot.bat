@ECHO OFF
ECHO Snapshot.bat %%Computer%% %%Group%% %%Destination%% %%Username%% %%Password%%
IF "%1"=="" (
	ECHO The first argument must be the computer to back up.
	GOTO :EOF
)
IF "%2"=="" (
	ECHO The second argument must be the group to back up.
	GOTO :EOF
)
ECHO CALL ParseINI.bat Snapshot %1 %2 %3 %4 %5
CALL ParseINI.bat Snapshot %1 %2 %3 %4 %5