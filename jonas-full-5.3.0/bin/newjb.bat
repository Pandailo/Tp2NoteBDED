@Echo Off

Rem   ---------------------------------------------------------------------------
Rem  JOnAS: Java(TM) Open Application Server
Rem  Copyright (C) 1999-2009 Bull S.A.S.
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
Rem  Initial developer(s): Benoit Pelletier
Rem  Contributor(s): Shenheng Liang
Rem   ---------------------------------------------------------------------------
Rem   $Id: newjb.bat 22065 2012-01-31 13:14:39Z joaninh $
Rem   ---------------------------------------------------------------------------

setlocal

Rem set the Environment Variables
if ["%JONAS_ROOT%"]==[""] goto setroot
if ["%JONAS_BASE%"]==[""] goto setbase

Rem Force endorsed directory for the ant process
Rem Ensure that the XML parser used is recent enough
set ANT_OPTS=%ANT_OPTS% -Djava.endorsed.dirs="%JONAS_ROOT%\lib\endorsed"

Rem if "%1" == "-cd"     goto cd_call

call ant -file "%JONAS_ROOT%\templates\newjb\build-jb.xml"
goto :EOF

:setroot
echo JONAS_ROOT not set.
goto :EOF

:setbase
echo JONAS_BASE not set.
goto :EOF

:cd_call
call ant -file "%JONAS_ROOT%\templates\newjb\build-jb.xml" create_jonas_clusterDaemon
goto :EOF
