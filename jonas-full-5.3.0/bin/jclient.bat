@Echo off
Rem ---------------------------------------------------------------------------
Rem JOnAS: Java(TM) Open Application Server
Rem Copyright (C) 1999-2010 Bull S.A.S.
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
Rem $Id: jclient.bat 21707 2011-09-07 09:44:45Z benoitf $
Rem ---------------------------------------------------------------------------

Rem Keep variables local to this script
setlocal
set ARGS=

Rem check JONAS_ROOT and JONAS_BASE
if ["%JONAS_ROOT%"]==[""] goto setroot
Rem Required for carol.properties file (add JONAS_BASE\conf to classpath)
call "%JONAS_ROOT%\bin\setenv.bat"
set JONAS_LIB=%JONAS_ROOT%\lib

Rem check client.jar
if not exist "%JONAS_LIB%\client.jar" goto noclient

Rem ---------------------------------------------
Rem Get args
Rem ---------------------------------------------
:loop_on_args
set VALUE=%~1
if ["%1"]==["-cp"]     goto cp_arg
if ["%1"]==["-security"] goto security
if ["%1"]==["-enable-jpa2"] goto jpa2
if ["%1"]==["-debug"]    goto debug_arg
if ["%VALUE:~0,2%"]==["-D"] goto java_opts
set ARGS=%ARGS% %1
goto next_arg

Rem Use security manager for jclient ?
:security
set JAVA_OPTS=%JAVA_OPTS% -Djava.security.manager -Djava.security.policy="%JONAS_BASE%\conf\java.policy"
goto next_arg

:jpa2
set JONAS_CLASSPATH=%JONAS_CLASSPATH%;%JONAS_LIB%\bootstrap\bundles-jpa2.0\ow2-jpa-2.0-spec.jar
set JONAS_CLASSPATH=%JONAS_CLASSPATH%;%JONAS_LIB%\repositories\maven2-internal\org\ow2\easybeans\osgi\easybeans-modules-persistence-eclipselink-2.x\${easybeans.version}\easybeans-modules-persistence-eclipselink-2.x-${easybeans.version}.jar
goto next_arg

Rem Add -D System Properties
:java_opts
set PROP=%~1
shift
set PROP=%PROP%=%1
set JAVA_OPTS=%JAVA_OPTS% %PROP%
goto next_arg

:cp_arg
shift
set JONAS_CLASSPATH=%JONAS_CLASSPATH%;%~1
goto next_arg

:debug_arg
shift
if not [%1]==[-p] goto debug_usage
shift
set JONAS_DEBUG_PORT=%1
set JONAS_DEBUG_SUSPEND=n
if not [%2]==[-s] goto set_debug_opts
shift
shift
set JONAS_DEBUG_SUSPEND=%1

:set_debug_opts
echo JOnAS Debug Info :
echo  listening on port : %JONAS_DEBUG_PORT%
echo  suspend mode : %JONAS_DEBUG_SUSPEND%
set JONAS_DEBUG_OPTS=-Xdebug -Xnoagent -Xrunjdwp:transport=dt_socket,server=y,address=%JONAS_DEBUG_PORT%,suspend=%JONAS_DEBUG_SUSPEND%
goto next_arg

:next_arg
shift
if not [%1]==[] goto loop_on_args

Rem Add client.jar
Rem CLASSPATH could be upgraded here
set JONAS_CLASSPATH=%JONAS_CLASSPATH%;%JONAS_LIB%\client.jar
set JONAS_CLASSPATH=%JONAS_CLASSPATH%;%JONAS_LIB%\jonas-client.jar
set JONAS_CLASSPATH=%JONAS_CLASSPATH%;%JONAS_LIB%\bootstrap\client-bootstrap.jar

set JAVA_OPTS=%JAVA_OPTS% -Djava.security.auth.login.config="%JONAS_BASE%\conf\jaas.config"
set JAVA_OPTS=%JAVA_OPTS% -Djava.endorsed.dirs="%JONAS_ROOT%\lib\endorsed"
if [%REGISTRY%]==[] goto next_java_opts
set JAVA_OPTS=%JAVA_OPTS% -Dregistry="%REGISTRY%"
:next_java_opts
set JAVA_OPTS=%JAVA_OPTS%  -Djonas.root="%JONAS_ROOT%"
%JAVA% -cp "%JONAS_CLASSPATH%" %JAVA_OPTS% %JONAS_DEBUG_OPTS% org.ow2.jonas.client.boot.Bootstrap org.ow2.jonas.client.ClientContainer %ARGS%
goto :EOF

:noclient
echo client.jar file must be present in JONAS_ROOT\lib directory
goto :EOF


:setroot
echo JONAS_ROOT must be set.
goto :EOF

:debug_usage
echo -debug option parameters are : "-debug -p <debug-port> [-s <suspend:y/n>]"
goto :EOF
