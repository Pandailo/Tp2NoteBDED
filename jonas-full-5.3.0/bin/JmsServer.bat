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
Rem  Initial developer(s): Philippe Durieux
Rem   Contributor(s):
Rem
Rem   ---------------------------------------------------------------------------
Rem   $Id: JmsServer.bat 21566 2011-08-08 12:28:12Z cazauxj $
Rem   ---------------------------------------------------------------------------

Rem  Check environment variables:
if not ["%JONAS_ROOT%"]==[""] Goto Run
@echo "JONAS_ROOT must be set"
Goto End

:Run
call "%JONAS_ROOT%\bin\setenv.bat"

set JAVA_OPTS=%JAVA_OPTS% -Djonas.root="%JONAS_ROOT%"
set JAVA_OPTS=%JAVA_OPTS% -Djonas.base="%JONAS_BASE%"
set JAVA_OPTS=%JAVA_OPTS% -Djava.security.manager
set JAVA_OPTS=%JAVA_OPTS% -Djava.security.policy="%JONAS_BASE%\conf\java.policy"
set JAVA_OPTS=%JAVA_OPTS% -Djava.endorsed.dirs="%JONAS_ROOT%\lib\endorsed"
set JAVA_OPTS=%JAVA_OPTS% -DTransaction=fr.dyade.aaa.util.NullTransaction
set JAVA_OPTS=%JAVA_OPTS% -Dfr.dyade.aaa.agent.A3CONF_DIR="%JONAS_BASE%\conf"

%JAVA% %JAVA_OPTS% -cp "%JONAS_ROOT%\lib\bootstrap\client-bootstrap.jar" org.ow2.jonas.client.boot.Bootstrap fr.dyade.aaa.agent.AgentServer 0 .\s0 %1 %2 %3 %4 %5 %6 %7 %8 %9

:End
