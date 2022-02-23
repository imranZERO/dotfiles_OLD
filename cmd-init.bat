@ECHO OFF

:: %HOMEDRIVE% = C:
:: %HOMEPATH% = \Users\imran
:: Program Files > ProgramFiles

:: SHORTCUT TARGET = %windir%\system32\cmd.exe /k "%HOME%\cmd-init.bat"

set prompt=$P$_$+$G$S
clink.exe inject