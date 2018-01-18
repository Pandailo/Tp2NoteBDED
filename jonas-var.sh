#doc -> jonas 5

export JAVA_HOME=/usr/local/jdk-1.7
export PATH=/usr/local/jdk1.7/bin:$PATH

export JONAS_ROOT=/home1/yv965015/VERON/M2/S1/BDED/TP/JONAS/jonas-full-5.3.0
export JONAS_BASE=/home1/yv965015/VERON/M2/S1/BDED/TP/JONAS/MyJonas
export PATH=$JONAS_ROOT/bin:$PATH

#a executer une seule fois pour executer une instances (dans jonasBase) a partir de JONAS_ROOT 
#cd $JONAS_ROOT/templates/newjb
##ant -f build-jb.xml create_jonas_base

#fichier jonas.properties sous MyJonas/conf
#activer ejb2 ou bien vérifier
#jonas.services jtm,db,validation,wm,ressource,ejb3,ejb2,jsf,jaxws,web,ear,depmonitor,datasource

#test de l'EJB
#localhost:9000 jonas/jonas

#config jdbc Oracle1.properties

#jclient -cp /home4/yv965015/VERON/M2/S1/BDED/TP/JONAS/MyJonas/work/ejb2s/jonas/helloWorld_2017.12.08-14.41.10.jar/helloWorld.jar client.HelloClient

