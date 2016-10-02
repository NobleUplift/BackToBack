@ECHO OFF
IF EXIST "%~2%~3.zip" (
	ECHO "C:\Program Files\7-Zip\7z" e "%~2%~3.zip" -o"%~1"
	"C:\Program Files\7-Zip\7z" e "%~2%~3.zip" -o"%~1"
) ELSE (
	ECHO "%~2%~3.zip" does not exist.
)