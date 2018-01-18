@Echo Off
Rem ---------------------------------------------------------------------------
Rem JOnAS: Java(TM) Open Application Server
Rem Copyright (C) 1999-2009 Bull S.A.S.
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
Rem $Id: probeJgroups.bat 22772 2013-02-15 11:41:23Z joaninh $
Rem ---------------------------------------------------------------------------

Rem Keep variables local to this script
setlocal ENABLEDELAYEDEXPANSION

Rem ---------------------------------------------
Rem set environment
Rem ---------------------------------------------
if ["%JONAS_ROOT%"]==[""] goto setroot
call "%JONAS_ROOT%\bin\setenv.bat"

Rem ---------------------------------------------
Rem set JAVA_OPTS
Rem ---------------------------------------------
Set JAVA_OPTS=%JAVA_OPTS% -Djonas.root="%JONAS_ROOT%"
Set JAVA_OPTS=%JAVA_OPTS% -Djonas.base="%JONAS_BASE%"
Set JAVA_OPTS=%JAVA_OPTS% -Djava.security.manager -Djava.security.policy="%JONAS_BASE%\conf\java.policy"
Set JAVA_OPTS=%JAVA_OPTS% -Djava.endorsed.dirs="%JONAS_ROOT%\lib\endorsed"

Rem ---------------------------------------------
Rem include jgroups class
Rem THIS MUST BE UPDATED FOR WINDOWS !!!!!!!!!!!!
Rem unix: JGROUPSLIB=`find $JONAS_ROOT/repositories -name jgroups*.jar`
Rem ---------------------------------------------
Rem Setting JGroups libraries.
for /r %JONAS_ROOT%/repositories %%i in (jgroups*.jar) do (set JGROUPSLIB=%%i %JGROUPSLIB%)



Set JONAS_CLASSPATH=%JGROUPSLIB%;%JONAS_CLASSPATH%

Rem ---------------------------------------------
Rem Run java command
Rem ---------------------------------------------
Set JONAS_CLASSPATH=%JONAS_CLASSPATH%;%JONAS_ROOT%\lib\bootstrap\client-bootstrap.jar

%JAVA% %JAVA_OPTS% -cp "%JONAS_CLASSPATH%" org.ow2.jonas.client.boot.Bootstrap org.jgroups.tests.Probe -timeout 500 %1 %2 %3 %4 %5 %6 %7 %8 %9
goto :EOF

:setjava
echo JAVA_HOME not set.
goto :EOF

:setroot
echo JONAS_ROOT not set.
goto :EOF
