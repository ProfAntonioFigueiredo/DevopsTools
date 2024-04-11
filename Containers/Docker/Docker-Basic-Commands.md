## DOCKER FILE – Possibilidades com DockerFile​

FROM > Inicializa o build de uma imagem a partir de uma imagem base <br/>
RUN > Executa um comando <br/>
LABEL > Adiciona metadados a imagem <br/>
CMD > Define o comndo e/ou os parametros padrao <br/>
EXPOSE > Define que o container precisa expor a porta em questão <br/>
ARG > Define um argumento para ser usado no processo de construcao <br/>
ENV > Define variaveis de ambiente <br/>
ADD > Copia arquivos ou diretorios ou arquivos remotos e adiciona ao sistema de arquivos da imagem <br/>
COPY > Copia arquivos ou diretorios e adiciona ao sistema de arquivos da Imagem <br/>
ENTRYPOINT > Ajuda voce a configurar um container que pode ser executado como um executavel <br/>
VOLUME > Define volumes que devem ser definidos <br/>
WORKDIR > Define o seu diretorio corrente <br/>

##  docker image build -t ubuntu/dockerimage-basic:v1 .

## Inicializa o build de uma imagem a partir de uma imagem base, ou seja, Limpa.
FROM ubuntu

## Executa um Comando 
RUN apt-get -y update
RUN apt-get -y install python3 && apt -y install vim && apt -y install curl

## Cria diretório  para o projeto e define o seu diretório corrente
WORKDIR /app

## Copia arquivos ou diretórios e adiciona ao sistema de arquivos da imagem
COPY arquivo-localhost.json arquivo-host-transferido.json
ADD https://stopublicfiles.blob.core.windows.net/frontendfiles/blob.jpeg blob.jpeg 
ADD https://stopublicfiles.blob.core.windows.net/frontendfiles/index.html index.html

## Adicona metadados na imagem
LABEL Image="Imagem  Docker para o ambiente de Desenvolvimento" \
      Author="Antonio Figueiredo" \
      Version="1.0" \
      Description="Projeto Challenge FIAP turma 2TDSPG 2024." \
      E-mail="profantonio.figueiredo@fiap.com"

## Define variáveis de ambiente ( somente como exemplo )
ENV MYSQL_USER=fiap \
    MYSQL_PASSWORD=docker12 \
    MYSQL_DATABASE=fiap_db \
    MYSQL_ROOT_PASSWORD=Fiap2tds@2024

## Defini volumes que devem ser definitivos (persistentes)   
VOLUME /DEV

## Define que o conatiner precisa expor uma porta em questão
## Porta padrão do servidor web 
## Porta padrao  do banco de dados MySQL
EXPOSE 8080

## Cria usuário linux com privilégios basicos para ser executado ao iniciar o Container
RUN adduser fiap
USER fiap
WORKDIR /home/antonio

## Define o comndo e/ou os parametros padrao ao iniciar o Container
CMD ["/app/index.html"]
