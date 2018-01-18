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
Rem Initial developer(s): Benoit Pelletier
Rem
Rem ---------------------------------------------------------------------------
Rem $Id: RAConfig.bat 21566 2011-08-08 12:28:12Z cazauxj $
Rem ---------------------------------------------------------------------------

setlocal

Rem  Check environment variables:
if ["%JONAS_ROOT%"]==[""] Goto SetRoot
call "%JONAS_ROOT%\bin\setenv.bat"

Rem ---------------------------------------------------------------------------
Rem Set JAVA_OPTS
Rem ---------------------------------------------------------------------------
Set JAVA_OPTS=%JAVA_OPTS% -Djonas.root="%JONAS_ROOT%"
Set JAVA_OPTS=%JAVA_OPTS% -Djonas.base="%JONAS_BASE%"
Set JAVA_OPTS=%JAVA_OPTS% -Djava.security.manager -Djava.security.policy="%JONAS_BASE%\conf\java.policy"
Set JAVA_OPTS=%JAVA_OPTS% -Djava.endorsed.dirs="%JONAS_ROOT%\lib\endorsed"

Set JONAS_CLASSPATH=%JONAS_ROOT%\lib\bootstrap\client-bootstrap.jar;%JONAS_CLASSPATH%
Set JONAS_CLASSPATH=%JONAS_ROOT%\lib\jonas-generators-raconfig.jar;%JONAS_CLASSPATH%
Set JONAS_CLASSPATH=%JONAS_ROOT%\lib\client.jar;%JONAS_CLASSPATH%

%JAVA% -cp "%JONAS_CLASSPATH%" %JAVA_OPTS% org.ow2.jonas.client.boot.Bootstrap org.ow2.jonas.generators.raconfig.RAConfig %1 %2 %3 %4 %5 %6 %7 %8 %9
Goto End

:SetRoot
@echo "JONAS_ROOT must be set"
Goto End

:End
