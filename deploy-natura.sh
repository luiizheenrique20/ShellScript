#!/bin/bash
dia=$(date +%d.%m.%Y_%s);
echo "digite o numero do caso";
read caso;
mkdir -p /backup-arquivos-deploy/$caso--$dia;
echo "Digite o nome completo do arquivo de deploy";
read archive;
tar -xvf /tmp/$archive -C /tmp/deploy-tmp/ --strip-components=1;
chown -R ftp.eddydata: /tmp/deploy-tmp;
for outputtree in $(find /tmp/deploy-tmp/ -type f |cut -c 17-);
    do cp -v /data/www/eddydata/trilhasancoragem/$outputtree /backup-arquivos-deploy/$caso--$dia/;
        done;
echo "Backup realizado";
echo "iniciando deploy";
# rsync -parv /tmp/deploy-tmp/ /data/www/eddydata/trilhasancoragem/;
echo "deploy realizado";
rm -rf /tmp/deploy-tmp/;