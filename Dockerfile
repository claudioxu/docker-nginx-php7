FROM ubuntu:latest

RUN rm /var/lib/apt/lists/* -vf
RUN apt-get -y update
RUN apt-get -y install nginx
RUN apt-get -y install php7.0-fpm php7.0-mcrypt php7.0-curl php7.0-cli php7.0-mysql php7.0-gd php7.0-xsl php7.0-json php7.0-intl php-pear php7.0-dev php7.0-common php7.0-mbstring php7.0-zip php-soap libcurl3 curl

RUN apt-get install -y supervisor
RUN apt-get install -y vim
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisord.conf

EXPOSE 80
EXPOSE 443

CMD ["/usr/bin/supervisord"]
