#!/bin/bash
# SSH tunnel settings
# SHUSR - ssh user account
# RHOST - remote server public ip (e.g. gw1.sharetome.com)
# RPORT - remote server public/private port
# LHOST - service host ip address (e.g. iTop server ip address)
# LPORT - service host listen port (e.g. iTop's HTTP port)
SHUSR=root
RHOST=106.14.203.234
RPORT=3000
LHOST=localhost
LPORT=22
CMD="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=35 -CNfg -R 0.0.0.0:$RPORT:$LHOST:$LPORT $SHUSR@$RHOST"
while true 
do
        ps -ef | grep -v grep | grep $RPORT\:$LHOST > /dev/null
        if [ $? -ne 0 ] ; then
        /bin/date -R
        echo "ssh tunnel $RPORT is down"
        $CMD 2>&1
        echo "ssh tunnel is down $RPORT" > ~/mail.txt # send a email notice to system manager
        # mail -s "Server address changed" leochan007@163.com < ~/mail.txt
        echo "mail notice sent"
        fi
        sleep 180
done
