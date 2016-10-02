IF EXIST %2.zip (
	ECHO "C:\Program Files\7-Zip\7z" e "%2.zip" -o"%1"
	"C:\Program Files\7-Zip\7z" e "%2.zip" -o"%1"
) ELSE (
	ECHO %2.zip does not exist.
)