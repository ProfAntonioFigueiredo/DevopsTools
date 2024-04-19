# Criando um Servidor Web com Docker e Nginx

O Docker é uma ferramenta de virtualização de containers que permite a criação de ambientes isolados, leves e portáteis para o desenvolvimento e execução de aplicativos. Um dos principais benefícios do Docker é a facilidade em criar imagens de containers personalizadas, utilizando o Dockerfile. Neste artigo, vamos criar um Dockerfile para um servidor web com Nginx.

## Passo 1: Escolhendo a imagem base

O primeiro passo na criação de um Dockerfile é escolher uma imagem base que possa ser usada como ponto de partida. No nosso caso, vamos escolher a imagem base nginx do Docker Hub, que já possui o servidor web <code>nginx</code> instalado.

## Passo 2: Definindo o ambiente
Agora que temos a imagem base escolhida, vamos definir o ambiente que será utilizado no container. Neste exemplo, vamos definir uma variável de ambiente <code>ENV</code> com o nome <code>APP_HOME</code> e o valor /<code>var/www/html</code>. Este valor será utilizado para definir o diretório raiz do servidor web.

<pre>
<code class="language-bash">ENV APP_HOME /var/www/html </code>
</pre>

## Passo 3: Copiando o código fonte

O próximo passo é copiar o código fonte do nosso servidor web para dentro do container. Para isso, vamos utilizar a instrução <code>COPY</code>. No exemplo abaixo, estamos copiando o conteúdo da pasta <code>./app</code> para dentro do diretório <code>APP_HOME</code> do container.

<pre>
<code class="language-bash">COPY ./app ${APP_HOME} </code>
</pre>

## Passo 4: Configurando o servidor web

Agora que o código fonte foi copiado para dentro do container, vamos configurar o servidor web Nginx para que ele possa servir o nosso aplicativo. Para isso, vamos criar um arquivo de configuração <code>nginx.conf</code> e copiá-lo para dentro do container.

O arquivo <code>nginx.conf</code> deve conter as configurações necessárias para que o Nginx possa servir o nosso aplicativo. No exemplo abaixo, estamos configurando o Nginx para servir arquivos estáticos e encaminhar todas as outras requisições para o arquivo <code>index.html</code>.

<pre>
<code class="language-bash">server {
    listen       80;
    server_name  localhost;

    root   ${APP_HOME};
    index  index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    location /assets/ {
        alias ${APP_HOME}/assets/;
    }
} </code>
</pre>

## Passo 5: Expondo a porta

O próximo passo é expor a porta do servidor web para que possa ser acessada a partir do host. Para isso, vamos utilizar a instrução <code>EXPOSE</code>. No exemplo abaixo, estamos expondo a porta <code>80</code> do container.

<pre>
<code class="language-bash"> EXPOSE 80 </code>
</pre>

## Passo 6: Iniciando o servidor web

Por fim, vamos definir o comando que será executado quando o container for iniciado. Neste caso, vamos utilizar o comando <code>nginx</code>, que inicia o servidor web Nginx.

<pre>
<code class="language-bash">CMD ["nginx", "-g", "daemon off;"] </code>
</pre>

## Dockerfile completo

Abaixo está o Dockerfile completo para um servidor web com Nginx.

<pre>
<code class="language-bash">FROM nginx

ENV APP_HOME /var/www/html

COPY ./app ${APP_HOME}

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] </code>
</pre>

## Construindo a imagem
Para construir a imagem, basta executar o seguinte comando na pasta onde o Dockerfile foi criado:

<pre>
<code class="language-bash">docker build -t meu-servidor-web-nginx . </code>
</pre>

Este comando irá criar uma imagem com o nome <code>meu-servidor-web-nginx</code> a partir do Dockerfile presente na pasta atual.

## Executando o container

Uma vez que a imagem foi criada, podemos executar o container utilizando o seguinte comando:

<pre>
<code class="language-bash">docker run -p 8080:80 meu-servidor-web-nginx </code>
</pre>

Este comando irá executar o container a partir da imagem <code>meu-servidor-web-nginx</code> e irá expor a porta <code>80</code> do container para a porta <code>8080</code> do host.

## Conclusão

Neste artigo, vimos como criar um Dockerfile para um servidor web com Nginx. Utilizamos a imagem base <code>nginx</code> do Docker Hub e configuramos o servidor web para servir o nosso aplicativo. Com o Docker, podemos criar imagens personalizadas de containers com facilidade, garantindo ambientes isolados, portáteis e escaláveis para o desenvolvimento e execução de aplicativos.

Dúvidas, comentário e sugestões postem nos comentários. 👋🏼 Até a próxima!

### Prof Antonio Figueiredo