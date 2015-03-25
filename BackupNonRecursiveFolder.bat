@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
REM If the archive does not exist, create it
IF NOT EXIST "%~2%~3.zip" (
	REM Iterate through every file that is not a folder and append it to a list
	REM There should be no subfolders in this folder because of RecursiveFolder
	REM It is just a precaution
	SET FILES=
	FOR /F "delims=" %%F IN ('dir /B %~1') DO (
		REM Get the shortname of the passed in directory and append
		REM the file to it in order to check if it is a folder.
		IF NOT EXIST %~s1\%%~F\NUL (
			SET FILES=!FILES! '%~1\%%~F'
		)
	)
	
	REM Replace single quotes with double quotes
	REM Then create and test the archive
	ECHO !FILES:'="!
	IF NOT "%FILES%"=="" (
		"C:\Program Files\7-Zip\7z" a "%~2%~3.zip" %FILES:'="%
		ECHO "C:\Program Files\7-Zip\7z" t "%~2%~3.zip" >> "%~2\Tests.txt
		"C:\Program Files\7-Zip\7z" t "%~2%~3.zip" >> "%~2\Tests.txt
	)
)
ENDLOCAL