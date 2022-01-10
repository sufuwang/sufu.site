#!/bin/bash

# cd ./book
# npm i
# npm run build
# mkdir ../dist
# mkdir ../dist/book
# cp -R ./docs/.vitepress/dist/* ../dist/book/

# -dist: 子库相对于仓库根目录的 dist 文件夹地址
# -name: 子库名称

submodule_name=''
submodule_dist_path=''

if [[ $1 == '-name' ]]
then
  submodule_name=$2
elif [[ $3 == '-name' ]]
then
  submodule_name=$4
fi

if [[ "$1" == '-dist' ]]
then 
  submodule_dist_path=$2
elif [[ "$3" == '-dist' ]]
then 
  submodule_dist_path=$4
fi

cd ./$submodule_name
yarn
yarn run build
mkdir ../dist/$submodule_name
cp -R ./$submodule_dist_path/dist/* ../dist/$submodule_name/