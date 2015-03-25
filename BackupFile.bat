MKDIR %~dp2
IF NOT EXIST %2.zip (
	"C:\Program Files\7-Zip\7z" a "%2.zip" "%1"
) ELSE (
	ECHO %2.zip already exists.
)