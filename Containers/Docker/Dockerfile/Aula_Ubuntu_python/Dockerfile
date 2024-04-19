FROM ubuntu

RUN apt-get -y install curl

WORKDIR /meu-site

COPY index.html /meu-site/index.html
ADD https://www.google.com.br /meu-site/pagina.json
ADD https://stopublicfiles.blob.core.windows.net/frontendfiles/blob.jpeg /meu-site/blob.jpeg 

# => Adicona metadados na imagem
LABEL Image="Entrega  de projeto Check Point 2" \
      Author="RM XXXX - Jose Luiz Ferreira " \
      Version="1.0" \
      Description="Essa é uma imagem contem o WebServer NGInx com uma pagina html estatica." \
      E-mail="joseluiz@fiap.com"

EXPOSE 80

RUN adduser pf1776
USER pf1776

