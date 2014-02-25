#!/bin/bash

if [ $1 ]; then
  ZAB_SERVER=$1
  cp /etc/zabbix/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf.org
  cat << EOF > /etc/zabbix/zabbix_agentd.conf
    Server=$ZAB_SERVER
    ServerActive=$ZAB_SERVER
    HostnameItem=system.hostname
    Include=/etc/zabbix/zabbix_agentd.d/
    EnableRemoteCommands=1
    LogRemoteCommands=1
    AllowRoot=1
    LogFile=/var/log/zabbix/zabbix_agentd.log
    LogFileSize=0
  EOF
  /etc/init.d/zabbix-agent restart
  /sbin/chkconfig zabbix-agent on
else
  echo 'Usage : sh install_zabbix_agentd_conf.sh ZABBIX_SERVER_IP_ADDRESS'
fi