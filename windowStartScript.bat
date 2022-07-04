@echo off
:: %HOMEDRIVE% = C:

where choco 2>NUL
if "%ERRORLEVEL%"=="0" (call :ChocoFound) else (call :NoChoco)

Echo Installing required stuff... ctrl + c if you want to skip to next install...

Echo Installing Java...
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
choco upgrade openjdk11 -y
:END
endlocal

Echo Installing Maven...
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
choco upgrade maven -y
:END
endlocal


Echo Installing Volta...
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
choco upgrade volta -y
:END
endlocal

Echo Installing GIT...
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
choco upgrade git -y
:END
endlocal

Echo Installing Node...
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
choco upgrade nodejs --version 14.15.1 -y
:END
endlocal

Echo Installing Mongo Db...
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
choco upgrade mongodb -y
:END
endlocal

Echo Installing intellijidea-ultimate...
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
choco upgrade intellijidea-ultimate -y
:END
endlocal

Echo Installing Visual studio Code...
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
choco upgrade vscode -y
:END
endlocal

Echo Installing NotepadPlusPlus ....
setlocal
:PROMPT
SET /P AREYOUSURE=Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
choco upgrade notepadplusplus -y
:END
endlocal

::Setting Environment variables
:: Set Proxy variables

Echo Installing Node...
setlocal
:PROMPT
SET /P AREYOUSURE=Proceed with environmental variables setup (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END
setx HTTP_PROXY "http://proxy-se-uan.ddc.teliasonera.net:8080"
setx HTTPS_PROXY "http://proxy-se-uan.ddc.teliasonera.net:8080"

:: Set Environment variables
:: setx variablename "C:\ProgramData\(value to setup)"

:END
endlocal

Echo End of Initial setup now go setup the rest of stuff you need ........ Thank you for the support

pause
goto :EOF

::::::::::::::::::::::::::::::::::::::::::::
:ChocoFound
::::::::::::::::::::::::::::::::::::::::::::
Echo Chocolaty	found.. proceeding with other installations...
goto :EOF

::::::::::::::::::::::::::::::::::::::::::::
:NoChoco
::::::::::::::::::::::::::::::::::::::::::::
Echo Chocolaty not found, installing it...
SET DIR=%~dp0%
::download install.ps1
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "((new-object net.webclient).DownloadFile('https://community.chocolatey.org/install.ps1','%DIR%install.ps1'))"
::run installer
%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%DIR%install.ps1' %*"
goto :EOF