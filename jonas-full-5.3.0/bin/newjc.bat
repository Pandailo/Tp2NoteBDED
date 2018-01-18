@echo off
:: ---------------------------------------------------------------------------
:: JOnAS: Java(TM) Open Application Server
:: Copyright (C) 2006-2009 Bull S.A.S.
:: Contact: jonas-team@objectweb.org
::
:: This library is free software; you can redistribute it and/or
:: modify it under the terms of the GNU Lesser General Public
:: License as published by the Free Software Foundation; either
:: version 2.1 of the License, or any later version.
::
:: This library is distributed in the hope that it will be useful,
:: but WITHOUT ANY WARRANTY; without even the implied warranty of
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
:: Lesser General Public License for more details.
::
:: You should have received a copy of the GNU Lesser General Public
:: License along with this library; if not, write to the Free Software
:: Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
:: USA
::
:: Initial developer(s): Benoit Pelletier
:: Contributor(s):
:: ---------------------------------------------------------------------------
:: $Id: newjc.bat 22065 2012-01-31 13:14:39Z joaninh $
:: ---------------------------------------------------------------------------
Rem Keep variables local to this script
setlocal ENABLEDELAYEDEXPANSION

if [%JONAS_ROOT%]==[] goto setroot

set NEWJCDIR=%JONAS_ROOT%\templates\newjc

Rem Force endorsed directory for the ant process
Rem Ensure that the XML parser used is recent enough
set ANT_OPTS=%ANT_OPTS% -Djava.endorsed.dirs="%JONAS_ROOT%\lib\endorsed"

if [%1]==[]   goto no_arg

Rem ---------------------------------------------
Rem Set the silence mode required
Rem ---------------------------------------------
:arg
if [%1]==[-auto]     goto auto_mode
if [%1]==[-debug] goto debug_arg
goto end


:execute
call ant -file "%NEWJCDIR%\build-jc.xml" %SILENCE_MODE%
goto end

:auto_mode
echo Mode Auto
set SILENCE_MODE=%SILENCE_MODE% -Dsilence.mode="true"
goto next_arg

:next_arg
shift
if not [%1]==[] goto arg
goto execute


Rem ---------------------------------------------
Rem No arg, silence mode by default
Rem ---------------------------------------------

:no_arg
echo Mode Step by Step
set SILENCE_MODE=%SILENCE_MODE% -Dsilence.mode="false"
goto execute
goto end

:setroot
echo JONAS_ROOT not set.
goto end


:debug_usage
echo -debug option parameters are : "-debug -p <debug-port> [-s <suspend:y/n>]"
goto end

:set_debug_opts
echo newjc Debug Info :
echo  listening on port : %DEBUG_PORT%
echo  suspend mode : %DEBUG_SUSPEND%
set  ANT_OPTS=%ANT_OPTS% -Xdebug -Xnoagent -Xrunjdwp:transport=dt_socket,server=y,address=%DEBUG_PORT%,suspend=%DEBUG_SUSPEND%
goto next_arg

:debug_arg
shift
if not [%1]==[-p] goto debug_usage
shift
set DEBUG_PORT=%1
set DEBUG_SUSPEND=n
shift
shift
if [%1]==[y] goto set_debug_suspend
goto set_debug_opts

:set_debug_suspend
set DEBUG_SUSPEND=%1
goto set_debug_opts

:end
goto :EOF
