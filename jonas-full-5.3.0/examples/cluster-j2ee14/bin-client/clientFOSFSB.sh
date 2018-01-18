#!/bin/sh

#export JAVA_OPTS=-Dcmi.conf.url=clientConfig/cmi-config.xml
#export JAVA_OPTS=-Dcmi.disabled=true
jclient org.ow2.jonas.examples.cluster.j2ee14.client.ClientFOSFSB -cp $JONAS_ROOT/examples/classes:$JONAS_ROOT/examples/cluster-j2ee14/output/ejbjars/ejbs.jar -carolFile clientConfig/carol.properties -traceFile clientConfig/traceclient.properties
