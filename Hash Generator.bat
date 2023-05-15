@echo off
echo Enter string here!>hash.txt
start hash.txt
:0
set /p hash="Hash: "
echo.
:1
for /f "delims=|" %%x IN ('find "/HASH" hash.txt') DO (
if "[%%x]"=="[/HASH]" (goto 0)
)

for /f "delims=|" %%x IN ('type hash.txt') DO (
echo %hash%:%%x
)

certutil -hashfile hash.txt "%hash%" | find /v "hash"
pause>nul
echo.

goto 1

exit