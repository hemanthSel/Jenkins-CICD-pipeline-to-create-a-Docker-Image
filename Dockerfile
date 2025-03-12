FROM  ubuntu:latest
MAINTAINER hemanthdev22@gmail.com
RUN apt update 
RUN sleep 60
RUN apt install apache2 -y
RUN apt install –y apache2-utils 
RUN apt clean 
RUN apt unzip
EXPOSE 80
#RUN  apt-get install apache2 \
 #zip\
 #unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip neogym.zip
RUN cp -rvf neogym/* .
RUN rm -rf neogym neogym.zip
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
EXPOSE 80
 
 
# FROM  centos:latest
# MAINTAINER vikashashoke@gmail.com
# RUN yum install -y httpd \
#  zip\
#  unzip
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/
# WORKDIR /var/www/html/
# RUN unzip shine.zip
# RUN cp -rvf shine/* .
# RUN rm -rf shine shine.zip
# CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# EXPOSE 80   
