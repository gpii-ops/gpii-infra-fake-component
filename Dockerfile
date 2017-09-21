FROM nginx:alpine

COPY index.html /usr/share/nginx/html/
RUN chmod a+r /usr/share/nginx/html/index.html
