#!/bin/bash -l
#$ -S /bin/bash
#echo $1
#if [[ $1 ]]
#then
#    docker build -t klimby/e-postgres:$1 -t klimby/e-postgres:latest .
#    docker push klimby/e-postgres:$1
#    docker push klimby/e-postgres:latest
#    rm *.tar
#    docker save klimby/e-postgres:$1 klimby/e-postgres:latest > e-postgres.$1.tar
#    ls -sh e-postgres.$1.tar
#    git tag -a $1 -m "version $1"
#    git commit -m "Version $1"
#    git push origin master
#else
#     echo -e "\033[31m Отсутствует номер версии \033[0m"
#fi


PACKAGE_VERSION=$(cat Dockerfile \
  | grep LABEL \
  | grep version \
  | awk -F= '{print $2}' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]'
 )

docker build -t klimby/e-postgres:$PACKAGE_VERSION -t klimby/e-postgres:latest .
    docker push klimby/e-postgres:$PACKAGE_VERSION
    docker push klimby/e-postgres:latest
    rm *.tar
    docker save klimby/e-postgres:$PACKAGE_VERSION klimby/e-postgres:latest > e-postgres.$PACKAGE_VERSION.tar
    ls -sh e-postgres.$PACKAGE_VERSION.tar
    git tag -a $PACKAGE_VERSION -m "version $PACKAGE_VERSION"
    git commit -m "Version $PACKAGE_VERSION docker complete"
