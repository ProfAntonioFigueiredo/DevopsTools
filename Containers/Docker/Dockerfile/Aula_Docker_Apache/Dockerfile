# Use uma imagem nginx baseada no Alpine
#FROM nginx:alpine

FROM httpd
#RUN apt-get -y update && \
#apt install -y httpd && \
#apt-get install -y curl

#--no-install-recommends é usado para reduzir o tamanho do container. Ele remove as sugestões de pacotes que não são desnecessárias 


# Define o diretório de trabalho como o diretório padrão do nginx

WORKDIR /meu-site
ADD https://stopublicfiles.blob.core.windows.net/frontendfiles/index.html ./meu-site/index.html


# Copie os arquivos da página web estática para o diretório de trabalho
COPY . /var/www/html/

# Defina as permissões apropriadas para os arquivos

#RUN chmod 644 ./index.html

# Exponha a porta 80, que é a porta padrão para o nginx
EXPOSE 80

# Comando para iniciar o nginx quando o contêiner for executado
CMD ["httpd", "-D", "FOREGROUND",]

# A explicação detalhada:
#nginx: Especifica o executável que será executado dentro do contêiner. Neste caso, é o servidor web Nginx.
#-g "daemon off;": Este é um argumento do Nginx que desativa o modo daemon (ou seja, o modo de execução em segundo plano). Isso faz com que o Nginx seja executado no primeiro plano do contêiner Docker. O daemon off é necessário para que o Docker consiga gerenciar o processo principal do contêiner corretamente.
#Portanto, quando você executa o contêiner Docker, o Nginx é iniciado e permanece em execução no primeiro plano, servindo sua página web estática para os clientes que acessam o contêiner.

