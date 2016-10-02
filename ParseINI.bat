@ECHO OFF
FOR /F "usebackq tokens=1,2 delims==" %%i IN (`wmic os get LocalDateTime /VALUE 2^>NUL`) DO IF '.%%i.'=='.LocalDateTime.' SET LDT=%%j
set LDT=%LDT:~0,4%-%LDT:~4,2%-%LDT:~6,2%

SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
SET COMMAND=%~1
SET COMPUTER=%~2
SET GROUP=%~3

IF NOT "%~7"=="" (
	ECHO 7 parameters have been provided, using %4 as version
	SET VERSION=SNAPSHOT
	SET HOSTNAME=%~5
	SET USERNAME=%~6
	SET PASSWORD=%~7
) ELSE (
	SET VERSION=%LDT%
	SET HOSTNAME=%~4
	SET USERNAME=%~5
	SET PASSWORD=%~6
)

SET FILE=%~2.ini
SET KEYGROUP=[%GROUP%]
SET CURRENT=
SET PROCESS=FALSE

CHCP 65001
:: http://stackoverflow.com/questions/2866117/read-INi-from-wINDOws-batch-file
FOR /f "usebackq delims=" %%A IN ("!FILE!") DO (
    SET LINE=%%A
    IF NOT "!LINE:~0,1!"==";" (
		IF "!LINE:~0,1!"=="[" (
			ECHO Keygroup is now !LINE!
			SET CURRENT=!LINE!
		) ELSE (
			IF "!GROUP!"=="*" (
				SET PROCESS=TRUE
			)
			
			IF "!KEYGROUP!"=="!CURRENT!" (
				SET PROCESS=TRUE
			)
			
			IF !PROCESS!==TRUE (
				FOR /f "tokens=1,2 delims==" %%B IN ("!LINE!") DO (
					SET KEY_POINTER=%%B
					SET VALUE_POINTER=%%C
					IF EXIST %COMMAND%%%B.bat (
						ECHO ParseCommand.bat "%COMMAND%" "!KEY_POINTER!" "%COMPUTER%" "!VALUE_POINTER!" "%VERSION%" "%HOSTNAME%" "%USERNAME%" "%PASSWORD%"
						CALL ParseCommand.bat "%COMMAND%" "!KEY_POINTER!" "%COMPUTER%" "!VALUE_POINTER!" "%VERSION%" "%HOSTNAME%" "%USERNAME%" "%PASSWORD%"
					)
				)
			)
		)
    )
    SET PROCESS=FALSE
)
ENDLOCAL