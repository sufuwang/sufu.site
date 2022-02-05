#!/bin/bash

submodule_branch=$1
work_status=$2

echo $submodule_branch
echo $work_status

chmod 777 ./script/*

source ./script/env.sh

echo '----- 拉取子库 -----'
if [[ $work_status == 'workflow' ]]; then
  echo 'workflow 模式下, 使用 action/checkoutv2 获取源码'
else
  echo '----- git pull 获取源码 -----'
  ./script/pull.sh book $submodule_branch
  ./script/pull.sh life $submodule_branch
fi
echo '----- End -----'

echo '----- 打包子库 -----'
rm -rf dist
mkdir dist
pwd
./script/build.sh book
./script/build.sh life
./script/thread.sh system .output
echo '----- End -----'

echo '----- 删除重名镜像与容器 -----'
docker rm -f $containerName
docker rmi $imageName
echo '----- End -----'

echo '----- 生成镜像 -----'
docker build -f ./DockerFile -t $imageName . --platform linux/amd64
echo '----- End -----'

echo '----- 查看 docker 镜像信息 -----'
docker image ls
docker ps -a
echo '----- End -----'

docker login
docker push $imageName

if [[ $work_status == 'workflow' ]]; then
  echo 'workflow 模式下, 使用 appleboy/ssh-action 更新远端镜像'
else
  echo '----- 本地部署 -----'
  ./script/deploy.sh
fi
