docker image rm sufuwang/sufu_site_nginx -f
docker container rm nginx_prod_container -f
docker build -f ./prod/nginx.dockerfile -t sufuwang/sufu_site_nginx .
docker login
docker tag sufu_site_nginx sufuwang/sufu_site_nginx
docker push sufuwang/sufu_site_nginx
# docker container run -d -p 9999:80 --name sufuwang/sufu_site_nginx nginx_prod_image

