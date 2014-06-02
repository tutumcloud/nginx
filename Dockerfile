FROM ubuntu:trusty
MAINTAINER Feng Honglin <hfeng@tutum.co>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD sites-enabled/ /etc/nginx/sites-enabled/
ADD app/ /app/

EXPOSE 80

CMD ["/usr/sbin/nginx"]
