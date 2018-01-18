@Echo Off

Rem   ---------------------------------------------------------------------------
Rem  JOnAS: Java(TM) Open Application Server
Rem  Copyright (C) 1999-2008 Bull S.A.S.
Rem  Contact: jonas-team@ow2.org
Rem
Rem  This library is free software; you can redistribute it and/or
Rem  modify it under the terms of the GNU Lesser General Public
Rem  License as published by the Free Software Foundation; either
Rem  version 2.1 of the License, or any later version.
Rem
Rem  This library is distributed in the hope that it will be useful,
Rem  but WITHOUT ANY WARRANTY; without even the implied warranty of
Rem  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Rem  Lesser General Public License for more details.
Rem
Rem  You should have received a copy of the GNU Lesser General Public
Rem  License along with this library; if not, write to the Free Software
Rem  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
Rem  USA
Rem
Rem   ---------------------------------------------------------------------------
Rem   $Id: GenIC.bat 21707 2011-09-07 09:44:45Z benoitf $
Rem   ---------------------------------------------------------------------------

setlocal

call "%JONAS_ROOT%\bin\setenv.bat"
echo JONAS_BASE is set to %JONAS_BASE%

rem  Check environment variables:
if ["%JONAS_ROOT%"]==[""] goto setRoot

set JONAS_CLASSPATH=%JONAS_CLASSPATH%;%JONAS_ROOT%\lib\bootstrap\client-bootstrap.jar;%JONAS_ROOT%\lib\client.jar

:set_opts
set JONAS_OPTS=-Djonas.root="%JONAS_ROOT%"
set JONAS_OPTS=%JONAS_OPTS% -Djonas.base="%JONAS_BASE%"
set JONAS_OPTS=%JONAS_OPTS% -Djava.security.manager -Djava.security.policy="%JONAS_BASE%\conf\java.policy"
set JONAS_OPTS=%JONAS_OPTS% -Djava.endorsed.dirs="%JONAS_ROOT%\lib\endorsed"

%JAVA% -cp "%JONAS_CLASSPATH%" %JONAS_OPTS% org.ow2.jonas.client.boot.Bootstrap org.ow2.jonas.generators.genic.GenIC %*
goto end

:setRoot
@echo "JONAS_ROOT must be set"
goto end

:end

