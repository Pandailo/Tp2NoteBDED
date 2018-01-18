@Echo Off
Rem ---------------------------------------------------------------------------
Rem JOnAS: Java(TM) Open Application Server
Rem Copyright (C) 1999-2008 Bull S.A.S.
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
Rem Initial developer(s): Nicolas Tachker
Rem ---------------------------------------------------------------------------
Rem $Id: joram_raconfig.bat 22668 2012-12-07 14:21:38Z albertil $
Rem ---------------------------------------------------------------------------

Rem Keep variables local to this script
setlocal ENABLEDELAYEDEXPANSION

Rem ---------------------------------------------
Rem set environment
Rem ---------------------------------------------
if ["%JONAS_ROOT%"]==[""] goto setroot
call "%JONAS_ROOT%\bin\setenv.bat"

REM Locate the JORAM ResourceAdapter to configure
set RA_LOCATION=repositories/maven2-internal/org/ow2/joram/joram-jca-jonas/5.8.0/joram-jca-jonas-5.8.0.rar
if not exist "%JONAS_BASE%\%RA_LOCATION%" goto compatibility_rar
Set RARJORAM=%JONAS_BASE%\%RA_LOCATION%

Rem Marker that help to come back at the beggining of the script when we tryed to use the compatibility rar
:joram_rar_available

set HOST=localhost
set PORT=16010
set SERVER=0

Rem ---------------------------------------------
Rem Get args
Rem ---------------------------------------------
if [%1]==[]   goto no_arg

:loop_on_args
Set VALUE=%~1
if [%1]==[-p]    goto port_arg
if [%1]==[-h]    goto host_arg
if [%1]==[-s]    goto sid_arg
if [%1]==[-v]    goto verbose
set ARGS=%ARGS% %1
goto next_arg

:port_arg
shift
if [%1]==[] goto usage
set PORT=%1
goto next_arg

:host_arg
shift
if [%1]==[] goto usage
set HOST=%1
goto next_arg

:sid_arg
shift
if [%1]==[] goto usage
set SERVER=%1
goto next_arg

:verbose
shift
set VERBOSE=-v
goto next_arg

:next_arg
shift
if not [%1]==[] goto loop_on_args

Rem ---------------------------------------------
Rem set JAVA_OPTS
Rem ---------------------------------------------
Set JAVA_OPTS=%JAVA_OPTS% -Djonas.root="%JONAS_ROOT%"
Set JAVA_OPTS=%JAVA_OPTS% -Djonas.base="%JONAS_BASE%"
Set JAVA_OPTS=%JAVA_OPTS% -Djava.security.manager -Djava.security.policy="%JONAS_BASE%\conf\java.policy"
Set JAVA_OPTS=%JAVA_OPTS% -Djava.endorsed.dirs="%JONAS_ROOT%\lib\endorsed"

Rem Update classpath
Set JONAS_CLASSPATH=%JONAS_ROOT%\lib\bootstrap\client-bootstrap.jar;%JONAS_ROOT%\lib\jonas-generators-raconfig.jar;%JONAS_ROOT%\lib\client.jar;%JONAS_CLASSPATH%

Rem ---------------------------------------------
Rem start Joram RAConfig
Rem ---------------------------------------------
echo "Target JORAM Resource Adapter: %RARJORAM%"
%JAVA% %JAVA_OPTS% -cp "%JONAS_CLASSPATH%" org.ow2.jonas.client.boot.Bootstrap org.objectweb.joram.client.connector.utils.RAConfig -rar "%RARJORAM%" -uhp %HOST% %PORT% %SERVER% -conf "%JONAS_BASE%\conf" %VERBOSE%
goto :EOF

:setjava
echo JAVA_HOME not set.
goto :EOF

:no_arg
echo No arguments specified.
goto usage

:usage
echo "Usage : joram_raconfig.bat -p <port> -h <host> -s <serverid>"
goto :EOF

:setroot
echo JONAS_ROOT not set.
goto :EOF

:setrar
echo "[ERROR] Cannot find a JORAM Resource Adapter file to process.";
echo "Expected locations:";
echo "  * %JONAS_BASE%\%RA_LOCATION% (newjb generated base)";
echo "  * %JONAS_BASE%\joram_ra_for_jonas.rar";
echo "Notice that the JORAM RA is automatically placed at the right location by 'newjb' when generating a new JONAS_BASE";
goto :EOF

:compatibility_rar
if not exist "%JONAS_BASE%\joram_ra_for_jonas.rar" goto setrar
Set RARJORAM=%JONAS_BASE%\joram_ra_for_jonas.rar
goto joram_rar_available
