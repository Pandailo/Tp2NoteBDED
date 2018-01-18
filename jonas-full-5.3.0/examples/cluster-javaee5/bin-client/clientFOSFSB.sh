#export JAVA_OPTS=-Dcmi.conf.url=clientConfig/cmi-config.xml
#export JAVA_OPTS=-Dcmi.disabled=true
jclient $JONAS_BASE/deploy/sampleCluster3.ear -jarClient clientfosfsb.jar -carolFile clientConfig/carol.properties -traceFile clientConfig/traceclient.properties