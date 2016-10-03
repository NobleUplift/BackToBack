NET USE \\%4\%~2 /u:%4\%5 %6
IF "%ERRORLEVEL%"=="0" (
	IF EXIST "\\%4\%~2\SNAPSHOT\%~3.zip" (
		DEL "\\%4\%~2\SNAPSHOT\%~3.zip"
	)
	"C:\Program Files\7-Zip\7z" a -tzip "\\%4\%~2\SNAPSHOT\%~3.zip" "%~1" -xr^^!Cache
	ECHO "C:\Program Files\7-Zip\7z" a -tzip "\\%4\%~2\SNAPSHOT\%~3.zip" "%~1" -xr^^!Cache
	"C:\Program Files\7-Zip\7z" t "\\%4\%~2\SNAPSHOT\%~3.zip" >> "\\%4\%~2\SNAPSHOT\Tests.txt
	ECHO "C:\Program Files\7-Zip\7z" t "\\%4\%~2\SNAPSHOT\%~3.zip" >> "\\%4\%~2\SNAPSHOT\Tests.txt
) ELSE (
	ECHO "SnapshotFolder.bat: Could not connect to %4!"
)