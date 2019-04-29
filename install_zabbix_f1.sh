#!/bin/bash
echo Install Zabbix
sudo mkdir /tmp/zabbix && cd /tmp/zabbix
sudo wget https://repo.zabbix.com/zabbix/4.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.2-1+bionic_all.deb
sudo dpkg -i zabbix-release_4.2-1+bionic_all.deb
sudo apt update
echo vamos instalar o zabbix
sudo apt install zabbix-agent -y
echo removendo .deb
sudo rm -rf zabbix-release_4.2-1+bionic_all.deb
echo zabbix instalado com sucesso.
echo VAAAAI CORINTHIANS !!!!
