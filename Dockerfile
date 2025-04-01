FROM  ubuntu:latest
MAINTAINER hemanthdev22@gmail.com

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get install apache2-utils && \
    apt-get unzip \

# Download and unzip the website files
WORKDIR /var/www/html/
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip && \
    unzip neogym.zip && \
    cp -r neogym/* /var/www/html/


# Expose port 80 for Apache
EXPOSE 80


#RUN  apt-get install apache2 \
 #zip\
 #unzip
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip /var/www/html/
# WORKDIR /var/www/html/
# RUN unzip neogym.zip
# #RUN mv * /var/www/html/
# RUN ls -ltr  /var/www/html/
# CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
# EXPOSE 80

#RUN cp -rvf neogym/* .
#RUN rm -rf neogym neogym.zip

 
