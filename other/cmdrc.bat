:: Open your registry and go to the following key:
:: HKEY_CURRENT_USER\Software\Microsoft\Command Processor or
:: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor
:: and add a string value named AutoRun and valued with the
:: absolute path of this file. eg: %HOME%\cmdrc.bat.
::
:: You can also add shortcut target to this file. [This is preferred]
:: eg: %windir%\system32\cmd.exe /k %HOME%\cmdrc.bat

@echo off

set prompt=$P$_$+$G$S
clink.exe inject
cls

doskey ..=cd ..
doskey ...=cd ..\..
doskey v=vim $*
doskey np=notepad $*
doskey ls=ls -lah $*
doskey gs=git status $*
doskey gc=git clone --depth=1 $*
doskey pyserve=python -m http.server $*
doskey hss=hugo serve --noHTTPCache $*
doskey liveserve=browser-sync start --server -f -w $*
