chmod 777 ./script/pull.sh
chmod 777 ./script/build.sh

./script/pull.sh book dev

rm -rf dist
mkdir dist
./script/build.sh -dist docs/.vitepress -name book 

imageName='sufu_image_nginx'
containerName='sufu_container_nginx'

docker rm -f $containerName
docker rmi $imageName

docker build -f ./DockerFile -t $imageName .
docker run -d -p 8080:80 --name $containerName $imageName