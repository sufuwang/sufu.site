#!/bin/bash

submodule_name=$1 # 子库文件夹
build_path=$2     # 子库打包文件地址

cd ./$submodule_name
yarn
yarn build
mkdir ../dist/$submodule_name
cp -R ./$build_path/* ../dist/$submodule_name/

cd ../dist/$submodule_name
yarn start
