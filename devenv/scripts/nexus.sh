#!/bin/bash    
#chkconfig:2345 20 90    
#description:nexus    
#processname:nexus    
export JAVA_HOME=/opt/jdk1.8.0_211/
case $1 in    
        start) su root /usr/local/program/nexus/bin/nexus start;;    
        stop) su root /usr/local/program/nexus/bin/nexus stop;;    
        status) su root /usr/local/program/nexus/bin/nexus status;;    
        restart) su root /usr/local/program/nexus/bin/nexus restart;;    
		dump ) su root /usr/local/program/nexus/bin/nexus dump ;; 
        console ) su root /usr/local/program/nexus/bin/nexus console ;;  		
        *) echo "require console | start | stop | restart | status | dump " ;;    
esac
