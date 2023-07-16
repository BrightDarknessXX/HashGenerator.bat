@echo off

:0
set /p hash="Hash algorythm: "
echo.

goto str
:1
del hash.txt
:str
Echo Enter string, type CTRL+Z in the same line, enter.
copy con hash.txt
echo.

for /f "delims=|" %%x IN ('find "/HASH" hash.txt') DO (
if "[%%x]"=="[/HASH]" (goto 0)
)

for /f "delims=|" %%x IN ('type hash.txt') DO (
echo %hash%:%%x
)

certutil -hashfile hash.txt "%hash%" | find /v "hash"
echo.

goto 1

exit
