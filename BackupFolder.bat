@ECHO OFF
IF NOT EXIST "%~2" (
	MKDIR "%~2"
)
IF NOT EXIST "%~2%~3.zip" (
	"C:\Program Files\7-Zip\7z" a "%~2%~3.zip" "%~1"
	ECHO "C:\Program Files\7-Zip\7z" t "%~2%~3.zip" >> "%~2\Tests.txt
	"C:\Program Files\7-Zip\7z" t "%~2%~3.zip" >> "%~2\Tests.txt
) ELSE (
	ECHO "%~2%~3.zip" already exists.
)