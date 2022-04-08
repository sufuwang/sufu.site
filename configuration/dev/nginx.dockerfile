FROM nginx

RUN pwd

WORKDIR /etc/nginx
COPY ./nginx.conf .

# WORKDIR /usr/share/nginx/html/book
# COPY ../../dist/book .

# WORKDIR /usr/share/nginx/html/system
# COPY ../../dist/system .

# WORKDIR /usr/share/nginx/html/life
# COPY ../../dist/life .


RUN ls

EXPOSE 80