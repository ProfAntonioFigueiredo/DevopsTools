FROM ubuntu

RUN apt update && apt install nginx -y

# => Define que o conatiner precisa expor uma porta em questão
EXPOSE 80/tcp
EXPOSE 80/udp

#/usr/sbin/nginx -g "daemon off;"
# docker run -d --name nginx-server -p 80:80 nginx ( Port Bind)

CMD ["nginx", "-g", "daemon off;"]

