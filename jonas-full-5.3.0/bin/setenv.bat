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
Rem   Contributor(s): Miroslav Halas
Rem   ---------------------------------------------------------------------------
Rem   $Id: setenv.bat 21707 2011-09-07 09:44:45Z benoitf $
Rem   ---------------------------------------------------------------------------


Rem check JONAS_ROOT and JONAS_BASE
if ["%JONAS_ROOT%"]==[""] goto setroot
if ["%JONAS_BASE%"]==[""] set JONAS_BASE=%JONAS_ROOT%

Rem ----------
Rem JAVA setup
Rem ----------
Rem We try to use first the java JVM in JAVA_HOME and if not found,
Rem we use the one found in the path.
Rem You can specify additional options to give to the Java JVM in the
Rem JAVA_OPTS environment variable.
Rem JAVA_HOME must be  set since config_env.bat requires it for tools.jar
set JAVA="%JAVA_HOME%\bin\java.exe"
set JAVAC="%JAVA_HOME%\bin\javac.exe"
Rem For JOnAS configuration files (carol.properties, trace.properties, ...)
Rem must be before the CLASSPATH (if carol.properties is redefined elsewhere)
set JONAS_CLASSPATH=%JONAS_BASE%\conf;%JONAS_CLASSPATH%
goto :EOF

:setroot
echo JONAS_ROOT must be set.
goto :EOF
