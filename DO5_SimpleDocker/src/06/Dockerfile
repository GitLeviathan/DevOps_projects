FROM nginx

WORKDIR /etc/nginx/
COPY ./nginx.conf .
COPY ./hello_world.c .
COPY ./start.sh .

RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev; \
	 apt-get clean && rm -rf /var/lib/apt/lists
RUN gcc hello_world.c -o hello_world -lfcgi 
RUN chmod 777 start.sh 

ENTRYPOINT ["sh", "./start.sh"]

