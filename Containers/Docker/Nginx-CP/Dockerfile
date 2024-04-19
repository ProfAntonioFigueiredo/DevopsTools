FROM nginx

ENV APP_HOME /var/www/html

COPY ./app ${APP_HOME}

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


FROM ubuntu

RUN apt-get -y update && \ 
    apt install -y nginx && \
    apt install -y curl && \
    apt install -y vim

WORKDIR /meu-site

COPY ./index.html /var/www/html

EXPOSE 80

CMD  ["nginx", "-g", "daemon off;"]

