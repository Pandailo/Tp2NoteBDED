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
Rem Initial developer(s): Philippe Durieux
Rem Contributor(s): Miroslav Halas
Rem        Adriana Danes :
Rem          - Change /config in /conf
Rem          - Use JONAS_BASE
Rem        Jerome Pioux:
Rem        - Remove extra spaces in :start_jonas_bg after %JAVA% - was causing
Rem          bug #306113 - happen only if the script is used from the tarball
Rem          (UNIX format [LF]). As a side note, with 4.8.3, the script will
Rem          be saved as DOS format [CRLF] inside SVN.
Rem        eyindanga:
Rem        - Start JOnAS on OSGi.
Rem
Rem ---------------------------------------------------------------------------
Rem $Id: jonas.bat 22159 2012-02-27 16:47:23Z cazauxj $
Rem ---------------------------------------------------------------------------

Rem Keep variables local to this script
setlocal ENABLEDELAYEDEXPANSION

if ["%JONAS_ROOT%"]==[""] goto emptyroot
goto execute

Rem %~dp0 is the directory in which this batch file is. JONAS_ROOT\bin in our case.
:emptyroot
pushd "%~dp0"
cd ..
@set JONAS_ROOT=%cd%
@echo JONAS_ROOT is set to %JONAS_ROOT%
popd

Rem ---------------------------------------------
Rem set environment
Rem ---------------------------------------------
if ["%JONAS_ROOT%"]==[""] goto setroot

:execute
call "%JONAS_ROOT%\bin\setenv.bat"

Rem Display JOnAS banner (if any)
if not exist "%JONAS_BASE%\conf\banner.txt" goto no_banner
more "%JONAS_BASE%\conf\banner.txt"

Rem Marker when no banner is available
:no_banner

Rem Set path for JOnAS bootstrap libraries
set LIB_BOOTSTRAP_PATH=%JONAS_ROOT%\lib\bootstrap

Rem Set JONAS_CLASSPATH
set JONAS_CLASSPATH=%JONAS_CLASSPATH%;%LIB_BOOTSTRAP_PATH%\jonas-launcher.jar
set JONAS_CLASSPATH=%JONAS_CLASSPATH%;%LIB_BOOTSTRAP_PATH%\jonas-commands.jar
set JONAS_CLASSPATH=%JONAS_CLASSPATH%;%LIB_BOOTSTRAP_PATH%\jonas-version.jar

Rem ---------------------------------------------
Rem set JONAS_OPTS
Rem ---------------------------------------------
Rem JAVA_HOME must be set since config_env.bat requires it for tools.jar
if ["%JAVA_HOME%"]==[""] goto setjava

Rem JONAS_OPTS may be already partially initialized
set JONAS_OPTS=%JONAS_OPTS% -Djonas.root="%JONAS_ROOT%"
set JONAS_OPTS=%JONAS_OPTS% -Djonas.base="%JONAS_BASE%"
set JONAS_OPTS=%JONAS_OPTS% -Dipojo.log.level=ERROR
set JONAS_OPTS=%JONAS_OPTS% -Djava.security.policy="%JONAS_BASE%\conf\java.policy"
set JONAS_OPTS=%JONAS_OPTS% -Dorg.omg.CORBA.ORBClass=org.jacorb.orb.ORB
set JONAS_OPTS=%JONAS_OPTS% -Dorg.omg.CORBA.ORBSingletonClass=org.jacorb.orb.ORBSingleton
set JONAS_OPTS=%JONAS_OPTS% -Dorg.omg.PortableInterceptor.ORBInitializerClass.standard_init=org.jacorb.orb.standardInterceptors.IORInterceptorInitializer
set JONAS_OPTS=%JONAS_OPTS% -Djava.security.auth.login.config="%JONAS_BASE%\conf\jaas.config"
set JONAS_OPTS=%JONAS_OPTS% -Djava.endorsed.dirs="%JONAS_ROOT%\lib\endorsed"
set JONAS_OPTS=%JONAS_OPTS% -Dcom.sun.CORBA.ORBDynamicStubFactoryFactoryClass=com.sun.corba.se.impl.presentation.rmi.StubFactoryFactoryStaticImpl
set JONAS_OPTS=%JONAS_OPTS% -Djavax.xml.soap.SOAPConnectionFactory=com.sun.xml.messaging.saaj.client.p2p.HttpSOAPConnectionFactory
set JONAS_OPTS=%JONAS_OPTS% -Djavax.xml.soap.SOAPFactory=com.sun.xml.messaging.saaj.soap.ver1_1.SOAPFactory1_1Impl
set JONAS_OPTS=%JONAS_OPTS% -Djavax.xml.soap.MetaFactory=com.sun.xml.messaging.saaj.soap.SAAJMetaFactoryImpl
set JONAS_OPTS=%JONAS_OPTS% -Djavax.xml.soap.MessageFactory=com.sun.xml.messaging.saaj.soap.ver1_1.SOAPMessageFactory1_1Impl

Rem ---------------------------------------------
Rem Get args
Rem ---------------------------------------------

if [%1]==[]   goto no_arg

set ARGS=
set MODE=
set JONASNAME=
set PINGTIMEOUT=
set PINGSTATE=
set ANNOTATE=
set WHERE=background
set HEADLESS=-Djava.awt.headless=true
set START_OPTS=
set FORCE_FOREGROUND=false
set ADMIN_CLASS=org.ow2.jonas.commands.admin.ClientAdmin
set USERNAME=
set PASSWORD=
:loop_on_args
set VALUE=%~1
if [%1]==[start]     goto start_arg
if [%1]==[stop]      goto stop_arg
if [%1]==[halt]      goto halt_arg
if [%1]==[admin]     goto admin_arg
if [%1]==[version]   goto version_arg
if [%1]==[check]     goto check_arg
if [%1]==[ntservice] goto ntservice_arg
if [%1]==[-standby]  goto standby_arg
if [%1]==[-running]  goto next_arg
if [%1]==[-halt]     goto next_arg
if [%1]==[-fg]       goto fg_arg
if [%1]==[-bg]       goto bg_arg
if [%1]==[-win]      goto win_arg
if [%1]==[-n]        goto n_arg
if [%1]==[-timeout]  goto timeout_arg
if [%1]==[-state]    goto state_arg
if [%1]==[-cfgsvc]   goto cfgsvc_arg
if [%1]==[-cp]       goto cp_arg
if [%1]==[-debug]    goto debug_arg
if [%1]==[-target]   goto target_arg
if [%1]==[-gui]      goto gui_arg
if [%1]==[-tui]      goto tui_arg
if [%1]==[-dev]      goto dev_arg
if [%1]==[-failStartOnError]      goto start_no_fail_arg
if [%1]==[-clean]    goto clean_arg
if [%1]==[-username] goto username_arg
if [%1]==[-password] goto password_arg
if %VALUE:~0,2%==-D  goto jonas_opts
if %VALUE:~0,2%==-X  goto java_opts
set ARGS=%ARGS% %1
goto next_arg

Rem First arguments : start, stop, admin, version, check

:start_arg
set MODE=start
set CLASS_TO_RUN=%ADMIN_CLASS% -start
goto next_arg

:stop_arg
set MODE=stop
set CLASS_TO_RUN=%ADMIN_CLASS% -stop
set PINGSTATE=-state j2ee.state.stopped
goto next_arg

:halt_arg
echo [DEPRECATED] Please use stop argument instead of halt
goto stop_arg

:admin_arg
set MODE=admin
set CLASS_TO_RUN=%ADMIN_CLASS%
set FORCE_FOREGROUND=true
goto next_arg

:version_arg
set MODE=version
set CLASS_TO_RUN=org.ow2.jonas.Version
set FORCE_FOREGROUND=true
goto next_arg

:check_arg
set MODE=check
set CLASS_TO_RUN=org.ow2.jonas.commands.check.CheckEnv
set FORCE_FOREGROUND=true
goto next_arg

Rem Take all arguments after ntservice and goto ntservice processing
:ntservice_arg
set MODE=ntservice
shift
set ARGS=
:nt_args
if [%1]==[] goto nt_args_done
set ARGS=%ARGS% %1
shift
goto nt_args

:nt_args_done
echo JONAS_BASE is set to %JONAS_BASE%
goto ntservice

Rem Add -D System Properties
:jonas_opts
Set PROP=%~1
shift
Set PROP=%PROP%=%1
Set JONAS_OPTS=%JONAS_OPTS% %PROP%
Set START_OPTS=%START_OPTS% %PROP%
goto next_arg

Rem Add -X System Properties
:java_opts
Set JAVA_OPTS=%JAVA_OPTS% %~1
goto next_arg

:standby_arg
set ARGS=%ARGS% -standby
if [%MODE%]==[stop] set FORCE_FOREGROUND=false
goto next_arg

:gui_arg
echo Start Felix GUI with JOnAS.
set START_OPTS=%START_OPTS% -Djonas.felix.gui.enabled=true
set HEADLESS=
goto next_arg

:tui_arg
echo Start Felix TUI with JOnAS.
set START_OPTS=%START_OPTS% -Djonas.felix.tui.enabled=true
set FORCE_FOREGROUND=true
goto next_arg

:dev_arg
echo JOnAS starts in developer mode.
set START_OPTS=%START_OPTS% -Djonas.developer=true
goto next_arg

:start_no_fail_arg
echo JOnAS starts in fail start on error.
set START_OPTS=%START_OPTS% -Djonas.start.nofail=true
goto next_arg

:clean_arg
echo Clean Felix cache before starting JOnAS.
set START_OPTS=%START_OPTS% -Djonas.cache.clean=true
goto next_arg

:fg_arg
set WHERE=foreground
goto next_arg

:bg_arg
set WHERE=background
goto next_arg

:win_arg
set WHERE=window
goto next_arg

:n_arg
shift
set JONASNAME=%1
set JONAS_OPTS=%JONAS_OPTS% -Djonas.name="%JONASNAME%"
set START_OPTS=%START_OPTS% -Djonas.name="%JONASNAME%"
goto next_arg

:timeout_arg
shift
set PINGTIMEOUT=-timeout %1
goto next_arg

:state_arg
shift
set PINGSTATE=-state %1
goto next_arg

:cfgsvc_arg
shift
if [%1]==[] goto cfgsvc_usage
set WHERE=cfgsvc
set WRAPPER_CONF=%1
goto start_arg

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

:target_arg
if [%MODE%]==[start] set ARGS=%ARGS% -start
if [%MODE%]==[stop] set ARGS=%ARGS% -stop
set MODE=admin
set ARGS=%ARGS% -target
goto next_arg

:username_arg
shift
set USERNAME=-username %1
goto next_arg

:password_arg
shift
set PASSWORD=-password %1
goto next_arg

:next_arg
if not [%1]==[-win] set PARAMS=%PARAMS% %1
shift
if not [%1]==[] goto loop_on_args

if [%MODE%]==[] goto no_mode

Rem ---------------------------------------------
Rem Remove RMI Annotation
Rem ---------------------------------------------
Rem set JONAS_OPTS=%JONAS_OPTS% -Djava.rmi.server.RMIClassLoaderSpi=org.ow2.jonas.lib.bootstrap.RemoteClassLoaderSpi

Rem Add Headless if needed
set START_OPTS=%START_OPTS% %HEADLESS%

Rem Print out JONAS_BASE
if [%MODE%]==[start] echo JONAS_BASE is set to %JONAS_BASE%
if [%MODE%]==[check] echo JONAS_BASE is set to %JONAS_BASE%

if %FORCE_FOREGROUND%==true set WHERE=foreground

Rem ---------------------------------------------
Rem Run java command
Rem ---------------------------------------------

if [%MODE%]==[stop] goto stop
if not [%MODE%]==[start] goto admin
if %WHERE%==cfgsvc goto cfgsvc_mode
if %WHERE%==window goto window
if %WHERE%==foreground goto foreground
if %WHERE%==background goto background
goto :EOF

:cfgsvc_mode
rem called by ANT create_windows_service
set JAVA_CMD=%JAVA% -classpath "%JONAS_CLASSPATH%" org.ow2.jonas.commands.wrapper.GenerateWrapperConf
%JAVA_CMD% -d ; -i 2 wrapper.java.classpath "%JONAS_CLASSPATH%" >>%WRAPPER_CONF%
%JAVA_CMD% -i 2 wrapper.java.additional %JAVA_OPTS% %JONAS_OPTS% >>%WRAPPER_CONF%
echo wrapper.app.parameter.10=%JONASNAME% >>%WRAPPER_CONF%
echo wrapper.ntservice.name=JOnAS_%JONASNAME% >>%WRAPPER_CONF%
echo wrapper.ntservice.displayname=JOnAS (%JONASNAME%) >>%WRAPPER_CONF%
goto :EOF

:foreground
REM start JOnAS in foreground mode
%JAVA% %JAVA_OPTS% %START_OPTS% %JONAS_OPTS% -cp "%JONAS_CLASSPATH%" %JONAS_DEBUG_OPTS% %CLASS_TO_RUN% %ARGS% %USERNAME% %PASSWORD%
goto :EOF

:background
REM start JOnAS in background mode
start /B "JOnAS" %JAVA% %JAVA_OPTS% %START_OPTS% %JONAS_OPTS% -cp "%JONAS_CLASSPATH%" %JONAS_DEBUG_OPTS% %CLASS_TO_RUN% %ARGS% %USERNAME% %PASSWORD%
%JAVA% %START_OPTS% %JONAS_OPTS% -cp "%JONAS_CLASSPATH%" %ADMIN_CLASS% -ping %PINGTIMEOUT% %PINGSTATE% %ARGS% %USERNAME% %PASSWORD%
goto :EOF

:stop
REM stop JOnAS and wait for it to stop
start /B "JOnAS" %JAVA%  %START_OPTS% %JONAS_OPTS% -cp "%JONAS_CLASSPATH%" %JONAS_DEBUG_OPTS% %CLASS_TO_RUN% %ARGS% %PINGTIMEOUT% %PINGSTATE% %USERNAME% %PASSWORD%
%JAVA% %START_OPTS% %JONAS_OPTS% -cp "%JONAS_CLASSPATH%" %ADMIN_CLASS% -ping %PINGTIMEOUT% %PINGSTATE% %ARGS% %USERNAME% %PASSWORD%
goto :EOF

:window
set WINDOW_TITLE="%HOSTNAME%:%JONASNAME%"
if %WINDOW_TITLE%==":" set WINDOW_TITLE="JOnAS Server"
start %WINDOW_TITLE% %JAVA% %JAVA_OPTS% %START_OPTS% %JONAS_OPTS% -cp "%JONAS_CLASSPATH%" %JONAS_DEBUG_OPTS% %CLASS_TO_RUN% %ARGS% %USERNAME% %PASSWORD%
goto :EOF

:admin
%JAVA%  %START_OPTS% %JONAS_OPTS% -cp "%JONAS_CLASSPATH%" %JONAS_DEBUG_OPTS% %CLASS_TO_RUN% %ARGS% %PINGTIMEOUT% %PINGSTATE% %USERNAME% %PASSWORD%
goto :EOF

:ntservice
"%JONAS_ROOT%\bin\jonasnt" %ARGS%
goto :EOF

:setjava
echo JAVA_HOME not set.
goto :EOF

:no_mode
echo No startup mode specified, specify start | stop | admin | version | check
goto usage

:no_arg
echo No arguments specified.
goto usage

:usage
echo jonas start | stop | admin | version | check| ntservice | -fg | -bg | -win | -n | -standby | -debug | -cfgsvc | -gui | -tui | -dev | -failStartOnError | -clean
echo Debug mode : jonas start -debug -p <debug-port> [-s <suspend:y/n>]
REM TODO: Add here explanation for the arguments
goto :EOF

:setroot
echo JONAS_ROOT not set.
goto :EOF

:debug_usage
echo -debug option parameters are : "-debug -p <debug-port> [-s <suspend:y/n>]"
goto :EOF

:cfgsvc_usage
echo -cfgsvc option requires filename for target wrapper.conf file
goto :EOF

