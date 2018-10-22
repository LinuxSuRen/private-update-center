FROM nginx

RUN mkdir -p /usr/share/nginx/html/plugins/

COPY rootCA/suren.crt /usr/share/nginx/html/
COPY www /usr/share/nginx/html/
COPY plugins/plugins /usr/share/nginx/html/plugins/

COPY nginx/nginx.conf /etc/nginx/
COPY nginx/default.conf /etc/nginx/conf.d
COPY nginx/index.html /usr/share/nginx/html/