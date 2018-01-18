@echo off
Rem ---------------------------------------------------------------------------
Rem JOnAS: Java(TM) Open Application Server
Rem Copyright (C) 1999-2009 Bull S.A.S.
Rem Copyright (c) 1999-2006 Tanuki Software Inc.
Rem Contact: jonas-team@ow2.org
Rem
Rem This library is free software; you can redistribute it and/or
Rem modify it under the terms of the GNU Lesser General Public
Rem License as published by the Free Software Foundation; either
Rem version 2.1 of the License, or any later version.
Rem
Rem This library is distributed in the hope that it will be useful,
Rem but WITHOUT ANY WARRANTY; without even the implied warranty of
Rem MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Rem Lesser General Public License for more details.
Rem
Rem You should have received a copy of the GNU Lesser General Public
Rem License along with this library; if not, write to the Free Software
Rem Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
Rem USA
Rem
Rem ---------------------------------------------------------------------------
Rem $Id: jonasnt.bat 21707 2011-09-07 09:44:45Z benoitf $
Rem ---------------------------------------------------------------------------

setlocal

if "%OS%"=="Windows_NT" goto nt
echo This script only works with NT-based versions of Windows.
goto :eof

:nt
Rem check JONAS_ROOT
if ["%JONAS_ROOT%"]==[""] goto setJonasRoot

Rem check JONAS_BASE
if ["%JONAS_BASE%"]==[""] goto setJonasBase

Rem check WRAPPER_HOME
if ["%WRAPPER_HOME%"]==[""] goto setWrapperHome

rem
rem Find the application home.
rem
set _WRAPPER_BIN=%WRAPPER_HOME%\bin\
set _WRAPPER_BASE=wrapper
set _WRAPPER_EXE=%_WRAPPER_BIN%%_WRAPPER_BASE%-windows-x86-32.exe
if exist "%_WRAPPER_EXE%" goto jonasbase
set _WRAPPER_EXE=%_WRAPPER_BIN%%_WRAPPER_BASE%-windows-x86-64.exe
if exist "%_WRAPPER_EXE%" goto jonasbase
set _WRAPPER_EXE=%_WRAPPER_BIN%%_WRAPPER_BASE%.exe
if exist "%_WRAPPER_EXE%" goto jonasbase
echo Unable to locate a Wrapper executable using any of the following names:
echo    %_WRAPPER_BIN%%_WRAPPER_BASE%-windows-x86-32.exe
echo    %_WRAPPER_BIN%%_WRAPPER_BASE%-windows-x86-64.exe
echo    %_WRAPPER_BIN%%_WRAPPER_BASE%.exe
rem pause
goto :eof

:jonasbase
rem Check that the JONAS_BASE is valid
if exist "%JONAS_BASE%\conf\jonas.properties" goto validate
echo The JONAS_BASE is not valid
rem pause
goto :eof

:validate
rem Find the requested command.
for /F %%v in ('echo %1^|findstr "^console$ ^start$ ^stop$ ^restart$ ^status$ ^install$ ^uninstall"') do call :exec set COMMAND=%%v

if "%COMMAND%" == "" (
    echo Usage: %0 { console : start : stop : restart : status : install : uninstall}
    goto :eof
) else (
    shift
)

set WRAPPER_CONF=%JONAS_BASE%\conf\wrapper.conf

rem
rem Run the application.
rem At runtime, the current directory will be that of wrapper.exe
rem
:run
call :%COMMAND%
rem if errorlevel 1 pause
goto :eof

:console
"%_WRAPPER_EXE%" -c "%WRAPPER_CONF%"
goto :eof

:start
"%_WRAPPER_EXE%" -t "%WRAPPER_CONF%"
goto :eof

:stop
"%_WRAPPER_EXE%" -p "%WRAPPER_CONF%"
goto :eof

:status
"%_WRAPPER_EXE%" -q "%WRAPPER_CONF%"
goto :eof

:install
"%_WRAPPER_EXE%" -i "%WRAPPER_CONF%"
goto :eof

:uninstall
"%_WRAPPER_EXE%" -r "%WRAPPER_CONF%"
goto :eof

:console
"%_WRAPPER_EXE%" -c "%WRAPPER_CONF%"
goto :eof

:restart
call :stop
call :start
goto :eof

:exec
%*
goto :eof

:setJonasRoot
echo JONAS_ROOT must be set.
goto :eof

:setJonasBase
echo JONAS_BASE must be set.
goto :eof

:setWrapperHome
echo WRAPPER_HOME must be set.
echo Please check your Tanuki Java Service wrapper installation.
goto :eof
