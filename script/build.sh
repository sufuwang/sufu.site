#!/bin/bash

# -dist: 子库相对于仓库根目录的 dist 文件夹地址
# -name: 子库名称

submodule_name=''

if [[ $1 == '-name' ]]
then
  submodule_name=$2
fi

cd ./$submodule_name
yarn
yarn run build
mkdir ../dist/$submodule_name
cp -R ./dist/* ../dist/$submodule_name/