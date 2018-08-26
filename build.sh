#!/bin/bash -l
#$ -S /bin/bash
echo $1
if [[ $1 ]]
then
    docker build -t klimby/e-postgres:$1 -t klimby/e-postgres:latest .
    docker push klimby/e-postgres:$1
    docker push klimby/e-postgres:latest
    docker save klimby/e-postgres:$1 klimby/e-postgres:latest > e-postgres.$1.tar
    ls -sh e-postgres.$1.tar
else
     echo -e "\033[31m Отсутствует номер версии \033[0m"
fi



