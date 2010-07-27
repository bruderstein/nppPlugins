@echo off
if "%~1" == "" (
  echo Add new entries to ..\files.sql. Tools required: md5sum, sed.
  echo Usage: %~nx0 "c:\some path\*.dll"
  goto :eof
)

setlocal
md5sum %1 > files.md5
:: next line is for debugging - it clears changes made to files.sql
::call git checkout ../files.sql

:: backup ..\files.sql
del ..\files.sql.bak
ren ..\files.sql files.sql.bak

:: set %date% to the format required by files.sql
for /f %%i in ('call GetDate.bat') do set date=%%i

:: recreate files.sql, appending the new entries
sed -f Md5ToSql.sed -e "s/$Date/%date%/g" < files.md5 > files.txt
sed -f AddFiles.sed < ..\files.sql.bak > ..\files.sql

:: cleanup
del files.txt files.md5
endlocal
