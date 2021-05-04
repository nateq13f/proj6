FROM ubuntu:latest

# runs dockerfile with no needed user interaction?
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt -y install apache2
RUN apt install -y apache2-utils
RUN apt clean
RUN service apache2 restart
# php?
RUN apt install phpmyadmin php-mbstring -y

## copy newid.php into the www/html 
RUN rm /var/www/html/index.html
COPY newid.php /var/www/html/

EXPOSE 80

# run apache in foreground
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
