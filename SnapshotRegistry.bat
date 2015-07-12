NET USE \\%4\%~2 /u:%4\%5 %6 >nul 2>&1
REG EXPORT "%~1" "\\%4\%~2\SNAPSHOT\%~n1.reg" /Y
ECHO Exported "%~1" to "\\%4\%~2\SNAPSHOT\%~n1.reg".