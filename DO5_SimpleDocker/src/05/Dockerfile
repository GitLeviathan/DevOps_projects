FROM nginx

WORKDIR /etc/nginx

COPY ./nginx.conf . 
COPY ./start.sh . 
COPY ./hello_world.c .

RUN apt-get update \
    && apt-get install -y gcc spawn-fcgi libfcgi-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists

RUN gcc hello_world.c -o hello_world -lfcgi 

RUN chmod 777 start.sh 

RUN useradd -d /home/doc -m -s /bin/bash doc
USER doc

ENTRYPOINT ["sh", "./start.sh"]
