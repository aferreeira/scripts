#!/bin/bash
LOGS=/home/<username>/logs
function fhv() {
	USUARIO=<username>
	SSH_CMD=$(echo ssh $USUARIO@$1)
	#md5localtime=$($SSH_CMD md5sum /etc/localtime | awk '{print $1}')
	#$SSH_CMD find  /usr/share/zoneinfo/ -type f -exec md5sum {} \; | grep $md5localtime | awk '{print $2}'
	md5zdump=$($SSH_CMD sudo zdump -v America/Sao_Paulo | grep 2015 | grep -i oct | md5sum  | awk '{print $1}' )
	NOMEMAQUINA=$($SSH_CMD hostname)
	if [[ $md5zdump == 823e902cda254e7021cc398351a6f536 ]]
	then 
		echo $NOMEMAQUINA ok $md5zdump
	else 
		echo $NOMEMAQUINA nok $md5zdump
	fi
}
MAQUINA=$1
#while read MAQUINA
#do
	ping -c 1 $MAQUINA > /dev/null
	retorno=$?
	echo $MAQUINA $retorno $(date)
	if [ $retorno -eq 0 ]
	then
		echo $MAQUINA $(date)
		fhv $MAQUINA | tee $LOGS/$MAQUINA 
	fi
#done < $1
