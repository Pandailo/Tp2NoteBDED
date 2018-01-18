@echo off
REM JAVA_OPTS=-Dcmi.conf.url=clientConfig\cmi-config.xml
REM JAVA_OPTS=-Dcmi.disabled=true
jclient -cp %JONAS_ROOT%\examples\cluster-j2ee14\output\ejbjars\ejbs.jar org.ow2.jonas.examples.cluster.j2ee14.client.ClientFOSFSB -carolFile clientConfig\carol.properties -traceFile clientConfig\traceclient.properties