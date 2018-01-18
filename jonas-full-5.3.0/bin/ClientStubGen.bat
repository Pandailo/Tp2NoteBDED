@ECHO OFF
REM ---------------------------------------------------------------------------
REM JOnAS: Java(TM) Open Application Server
REM Copyright (C) 1999-2008 Bull S.A.S.
REM Contact: jonas-team@ow2.org
REM
REM This library is free software; you can redistribute it and/or
REM modify it under the terms of the GNU Lesser General Public
REM License as published by the Free Software Foundation; either
REM version 2.1 of the License, or any later version.
REM
REM This library is distributed in the hope that it will be useful,
REM but WITHOUT ANY WARRANTY; without even the implied warranty of
REM MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
REM Lesser General Public License for more details.
REM
REM You should have received a copy of the GNU Lesser General Public
REM License along with this library; if not, write to the Free Software
REM Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
REM USA
REM
REM Initial developer(s): Guillaume Sauthier
REM
REM ---------------------------------------------------------------------------
REM $Id: ClientStubGen.bat 21707 2011-09-07 09:44:45Z benoitf $
REM ---------------------------------------------------------------------------

SET JONAS_LIB=%JONAS_ROOT%\lib

if ["%JONAS_ROOT%"]==[""] Goto RootIsNotSetError

CALL "%JONAS_ROOT%\bin\setenv.bat"
ECHO JONAS_BASE is set to %JONAS_BASE%

SET JONAS_OPTS=-Djonas.root="%JONAS_ROOT%"
SET JONAS_OPTS=%JONAS_OPTS% -Djonas.base="%JONAS_BASE%"
SET JONAS_OPTS=%JONAS_OPTS% -Djava.security.manager -Djava.security.policy="%JONAS_BASE%\conf\java.policy"
SET JONAS_OPTS=%JONAS_OPTS% -Djava.endorsed.dirs="%JONAS_ROOT%\lib\endorsed"

REM add ow_jonas_bootstrap.jar to the classpath for the bootstrap class
SET JONAS_CLASSPATH=%JONAS_CLASSPATH%;%JONAS_ROOT%\lib\bootstrap\client-bootstrap.jar;%JONAS_ROOT%\lib\jonas-generators-clientstubs.jar;%JONAS_ROOT%\lib\client.jar

%JAVA% -cp "%JONAS_CLASSPATH%" %JONAS_OPTS% org.ow2.jonas.client.boot.Bootstrap org.ow2.jonas.generators.genclientstub.ClientStubGen %*
GOTO End

:RootIsNotSetError
ECHO "JONAS_ROOT must be set"
GOTO End

:End
