#!/bin/bash -e

if [ "$UID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Only run it if we can (ie. on Ubuntu/Debian)
if [ -x /usr/bin/apt-get ]; then
  apt-get update
  apt-get -y install zabbix-agent sysv-rc-conf
  sysv-rc-conf zabbix-agent on
  sed -i 's/Server=127.0.0.1/Server=13.57.145.115/' /etc/zabbix/zabbix_agentd.conf
  sed -i 's/ServerActive=127.0.0.1/ServerActive=13.57.145.115/' /etc/zabbix/zabbix_agentd.conf
  HOSTNAME=`hostname` && sed -i "s/Hostname=Zabbix\ server/Hostname=$HOSTNAME/" /etc/zabbix/zabbix_agentd.conf
  service zabbix-agent restart
fi

# Only run it if we can (ie. on RHEL/CentOS)
if [ -x /usr/bin/yum ]; then
  yum -y update
  rpm -Uvh https://repo.zabbix.com/zabbix/4.2/rhel/7/x86_64/zabbix-release-4.2-1.el7.noarch.rpm
  yum -y install zabbix-agent
  chkconfig zabbix-agent on
  sed -i 's/Server=127.0.0.1/Server=13.57.145.115/' /etc/zabbix/zabbix_agentd.conf
  sed -i 's/ServerActive=127.0.0.1/ServerActive=13.57.145.115/' /etc/zabbix/zabbix_agentd.conf
  HOSTNAME=`hostname` && sed -i "s/Hostname=Zabbix\ server/Hostname=$HOSTNAME/" /etc/zabbix/zabbix_agentd.conf
  service zabbix-agent restart
fi