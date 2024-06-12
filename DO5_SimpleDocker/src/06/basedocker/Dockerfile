FROM nginx

WORKDIR /etc/nginx/
COPY ./nginx.conf .
COPY ./start.sh .

RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev; \
    apt-get clean && rm -rf /var/lib/apt/lists; \
    chown -R nginx:nginx /etc/nginx/; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /var/log/nginx/error.log; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid

USER nginx

ENTRYPOINT ["sh", "./start.sh"]
