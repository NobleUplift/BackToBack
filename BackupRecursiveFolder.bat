SET SUBFOLDERS=FALSE
FOR /F "delims=" %%D IN ('dir /B %~1') DO (
	REM ECHO %~s1\%%~snD
	FOR %%E IN ("%~s1\%%~snD") DO (
		REM ECHO Checking for subfolders in %%~sE
		IF EXIST %%~sE\NUL (
			REM ECHO Found subfolder in %%~sE
			CALL BackupRecursiveFolder.bat "%%~sE" "%~2" "%~3\%%D"
			SET SUBFOLDERS=TRUE
		)
	)
)

IF %SUBFOLDERS%==TRUE (
	CALL BackupNonRecursiveFolder.bat "%~1" "%~2" "%~3"
) ELSE (
	CALL BackupFolder.bat "%~1" "%~2" "%~3"
)