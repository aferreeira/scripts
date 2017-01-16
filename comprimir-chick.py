#!/usr/bin/env python3

# AUTHOR: Alexandre Ferreira
# DESCRIPTION: Comprimir diretorio para arquivo .tgz

import tarfile
import time
import sys

def ajuda():
    ajuda.help = "ERRO: Informe o script.py, diretorio a ser comprimido e nome do arquivo .tgz de destino a ser gerado separados por 'espaço':"
    ajuda.helptgz = "ERRO: Favor informar o arquivo de destino com a extensão '.tgz' no final dele corretamente."
    ajuda.exemplo = "Exemplo: ./comprimir-chick.py /home/username/dir_to_tar filename.tgz"
ajuda()

def tar():
    pathfile = str(sys.argv[2])
    dirtotar = str(sys.argv[1])
    date = time.strftime("%Y%m%d-%H%M")

    if pathfile[-4:] == ".tgz":
        pathwithout = pathfile[:-4]
    else:
        print('\x1b[6;30;42m' + ajuda.helptgz + '\x1b[0m')
        sys.exit()

    with tarfile.open(pathwithout + date + ".tgz", "w:gz") as tar:
        tar.add(dirtotar)

if len(sys.argv) != 3:
    print('\x1b[6;30;42m' + ajuda.help + '\x1b[0m')
    print('\x1b[6;30;42m' + ajuda.exemplo + '\x1b[0m')
    sys.exit()
else:
    tar()
