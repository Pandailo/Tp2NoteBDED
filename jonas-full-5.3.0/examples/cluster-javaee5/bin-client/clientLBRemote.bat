REM set JAVA_OPTS=-Dcmi.conf.url=clientConfig\cmi-config.xml
REM set JAVA_OPTS=-Dcmi.disabled=true
jclient %JONAS_BASE%\deploy\sampleCluster3.ear -jarClient clientlbremote.jar -carolFile clientConfig\carol.properties -traceFile clientConfig\traceclient.properties