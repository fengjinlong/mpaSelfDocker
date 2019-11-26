FROM nginx
LABEL name="nodeMpa"
LABEL version="1.0"
COPY ./dist /usr/share/nginx/html
COPY ./nodeMpa.conf /etc/nginx/conf.d
EXPOSE 8081