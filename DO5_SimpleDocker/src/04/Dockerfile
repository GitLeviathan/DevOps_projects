FROM nginx

WORKDIR /etc/nginx
COPY ./nginx.conf . 
COPY ./start.sh . 
COPY ./hello_world.c .

RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev && gcc hello_world.c -o hello_world -lfcgi && chmod 777 start.sh 

ENTRYPOINT ["sh", "./start.sh"]
