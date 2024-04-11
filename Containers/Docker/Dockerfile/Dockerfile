# Inicializa o build de uma magem a partir de uam imagem base, ou seja, Limpa.
FROM ubuntu

# Executa um Comando 
RUN apt-get -y update
RUN apt-get -y install python3 && apt -y install vim && apt -y install curl

# Cria diretório  para o projeto e define o seu diretório corrente
WORKDIR /app

# => Copia arquivos ou diretórios e adiciona ao sistema de arquivos da imagem
COPY arquivo-localhost.json arquivo-host-transferido.json
ADD https://stopublicfiles.blob.core.windows.net/frontendfiles/blob.jpeg blob.jpeg 
ADD https://stopublicfiles.blob.core.windows.net/frontendfiles/index.html index.html

# => Adicona metadados na imagem
LABEL Image="Imagem  Docker para o ambiente de Desenvolvimento" \
      Author="Antonio Figueiredo" \
      Version="1.0" \
      Description="Projeto Challenge FIAP turma 2TDSPG 2024." \
      E-mail="profantonio.figueiredo@fiap.com"

# => Define variáveis de ambiente
ENV MYSQL_USER=fiap \
    MYSQL_PASSWORD=docker12 \
    MYSQL_DATABASE=fiap_db \
    MYSQL_ROOT_PASSWORD=Fiap2tds@2024

# => Defini volumes que devem ser definitivos  (persistentes)   
VOLUME /DEV

# => Define que o conatiner precisa expor uma porta em questão
# Porta padrão do servidor web 
# Porta padrao  do banco de dados MySQL
EXPOSE 8080

RUN adduser fiap
USER fiap
WORKDIR /home/antonio

CMD ["/app/index.html"]