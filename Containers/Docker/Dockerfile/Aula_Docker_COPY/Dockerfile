# => Copia arquivos ou diretórios e adiciona ao sistema de arquivos da imagem

FROM ubuntu

RUN apt-get -y update
RUN apt-get -y install python3 && apt -y install vim && apt -y install curl
WORKDIR /app
COPY arquivo-host.json arquivo-host-transferido.json
ADD https://www.google.com.br pagina.html
ADD https://stopublicfiles.blob.core.windows.net/frontendfiles/blob.jpeg blob.jpeg 
ADD https://stopublicfiles.blob.core.windows.net/frontendfiles/index.html index.html

