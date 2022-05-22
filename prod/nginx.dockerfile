FROM nginx

RUN pwd

WORKDIR /etc/nginx
COPY ./prod/nginx.conf .

WORKDIR /usr/share/nginx/html/book
COPY ./dist/book .

WORKDIR /usr/share/nginx/html/system
COPY ./dist/system .

WORKDIR /usr/share/nginx/html/life
COPY ./dist/life .

WORKDIR /usr/share/nginx/html/main
COPY ./dist/main .

RUN ls

EXPOSE 80