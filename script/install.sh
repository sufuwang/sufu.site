submodule_branch=$1

chmod 777 ./script/*

source ./script/env.sh
./script/pull.sh book $submodule_branch

rm -rf dist
mkdir dist
./script/build.sh -dist docs/.vitepress -name book 


docker rm -f $containerName
docker rmi $imageName

docker build -f ./DockerFile -t $imageName . --platform linux/amd64
docker login
docker push $imageName

./script/deploy.sh