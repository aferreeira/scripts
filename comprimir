#!/bin/bash
export alvo=$1
export destino=$2
function ajuda() {
        echo ERRO
        echo Erro nos parametros
        echo $0 origem destino.tgz
}
function processar() {
        du -sh $alvo
        tar cf - $alvo |pv  -s $(du -sb $alvo| awk '{print $1}') |pigz -p 4 -9 > $destino
}
if [ $# -lt 2 ]
then
        ajuda
        exit 1
else
        if [ -a $alvo ]
        then
                processar $1 $2
        fi
fi
