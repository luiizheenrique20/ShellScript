#!/bin/bash

IFS=$'\n'

for x in `cat hosts`
do

echo $x
IP=`echo $x | awk '{print $1}'`
USER=`echo $x | awk '{print $2}' | awk -F"=" '{print $2}'`
PEM=`echo $x | awk -F"/" '{print $5}'`
#exit 1

if [ ${USER} = "ubuntu" ]
then
ssh -i /home/luizhossi/pem/${PEM} $USER@$IP "sudo apt install python python-pip -y"

else

ssh -i /home/luizhossi/pem/${PEM} $USER@$IP "sudo yum install python python-pip -y"
fi

done

