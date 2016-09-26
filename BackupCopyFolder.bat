FOR /f "tokens=4-5 delims=. " %%i IN ('ver') DO SET VERSION=%%i.%%j
if "%version%" == "10.0" (
	ROBOCOPY "%~1" "%~2%~3" /E /COPYALL /DCOPY:DAT /SL
) ELSE (
	ROBOCOPY "%~1" "%~2%~3" /E /COPYALL /DCOPY:T /SL
)
REM /XC /XN /XO /COPY:DAT