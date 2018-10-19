FROM nginx

RUN mkdir -p /usr/share/nginx/html/plugins/

COPY www/* /usr/share/nginx/html/
COPY plugins/plugins /usr/share/nginx/html/plugins/