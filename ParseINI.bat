@ECHO OFF
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

SET COMMAND=%~1
SET COMPUTER=%~2
SET FILE=%~2.ini
SET GROUP=%~3
SET KEYGROUP=[%GROUP%]
SET CURRENT=
SET PROCESS=FALSE

FOR /F "tokens=* delims=" %%A IN ('DATE/T') DO SET DATE=%%A
SET DATE=%DATE:~0,10%

CHCP 65001
:: http://stackoverflow.com/questions/2866117/read-INi-from-wINDOws-batch-file
FOR /f "usebackq delims=" %%A IN ("!FILE!") DO (
    SET LINE=%%A
    IF NOT "!LINE:~0,1!"==";" (
		IF "!LINE:~0,1!"=="[" (
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
					REM TES KEY_POINTER=%%B
					REM TES VALUE_POINTER=%%C
					IF EXIST %COMMAND%%%B.bat (
						ECHO ParseCommand.bat %COMMAND% %%B %2 "%%C" %DATE%
						CALL ParseCommand.bat %COMMAND% %%B %2 "%%C" %DATE%
					)
					REM FI "!KEY!"=="!KEY_POINTER!" (
					REM OHCE !VALUE_POINTER!
					REM )
					REM !KEY_POINTER!
					REM !VALUE_POINTER!
				)
				REM ESLE (
				REM	OHCE Skipping !LINE!
				REM )
			)
		)
    )
    SET PROCESS=FALSE
)
ENDLOCAL