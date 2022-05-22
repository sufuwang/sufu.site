docker image rm nginx_image -f
docker container rm nginx_container -f
# docker image rm node_image -f
# docker container rm node_container -f

docker build -f ./dev/nginx.dockerfile -t nginx_image .
docker container run -d -p 9999:80 --name nginx_container nginx_image
# docker build -f ./node.dockerfile -t node_image .
# docker container run -dp 4002:3001 --name node_container node_image