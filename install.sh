#!/bin/bash

# shell 脚本参数
submodule_branch=$1 # 子库分支: dev | master
work_status=$2      # 工作模式: workflow | local
echo $submodule_branch
echo $work_status

# 拉取子库
function pullSubmodule() {
  cd ./$1
  git checkout $submodule_branch
  git pull origin $submodule_branch
  cd ..
}

# 打包子库
function buildSubmodule() {
  cd ./$1
  yarn
  yarn run build
  mkdir ../dist/$1
  pwd
  cp -R ./$2/* ../dist/$1/
  cd ..
}

echo '----- 拉取子库 -----'
if [[ $work_status == 'workflow' ]]; then
  echo 'workflow 模式下, 使用 action/checkoutv2 获取源码'
elif [[ $work_status == 'local' ]]; then
  echo '----- git pull 获取源码 -----'
  git submodule init
  git submodule update
  pullSubmodule book
  pullSubmodule life
  pullSubmodule system
fi
echo '----- End -----'

echo '----- 打包子库 -----'
rm -rf dist
mkdir dist
pwd
buildSubmodule book dist
buildSubmodule life dist
buildSubmodule system .output
echo '----- End -----'

echo '----- 删除重名镜像与容器 -----'
docker rm -f sufu_site_node
docker rm -f sufu_site_nginx
docker rmi sufu_site_node
docker rmi sufu_site_nginx
echo '----- End -----'

echo '----- 生成镜像 -----'
docker compose -p sufu_site create
echo '----- End -----'

echo '----- 查看 docker 镜像信息 -----'
docker image ls
docker ps -a
echo '----- End -----'

docker login
docker tag sufu_site_nginx sufuwang/sufu_site_nginx
docker tag sufu_site_nodejs sufuwang/sufu_site_nodejs
docker push sufuwang/sufu_site_nginx
docker push sufuwang/sufu_site_nodejs

if [[ $work_status == 'workflow' ]]; then
  echo 'workflow 模式下, 使用 appleboy/ssh-action 更新远端镜像'
elif [[ $work_status == 'local' ]]; then
  echo '----- 本地部署 -----'
  ssh ubuntu@43.134.166.176 "
    sudo chmod 666 /var/run/docker.sock
    docker login
    docker rm sufu.site.nginx -f
    docker rm sufu.site.nodejs -f
    docker rmi sufuwang/sufu_site_nginx
    docker rmi sufuwang/sufu_site_nodejs
    docker pull sufuwang/sufu_site_nginx
    docker pull sufuwang/sufu_site_nodejs
    docker run -d -p 80:80 -p 4002:4002 --name sufu.site.nginx sufuwang/sufu_site_nginx
    docker run -d -h 0.0.0.0 -p 4002:4002 --name sufu.site.nodejs sufuwang/sufu_site_nodejs
  "
fi
