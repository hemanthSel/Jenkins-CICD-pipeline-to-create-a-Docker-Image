FROM httpd:latest 
MAINTAINER hemanthdev22@gmail.com

# Update package lists and install necessary packages
# RUN apt-get update && \
#     apt-get install -y apache2 && \
#     apt-get install -y apache2-utils && \
#     apt-get install -y unzip && \
#     apt-get install wget
#   ubuntu:latest

# Download and unzip the website files
WORKDIR /var/www/html/
RUN
docker image build -t $JOB_NAME:v1.$BUILD_ID .
 #wget https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip 
   # unzip neogym.zip && \
   # ls -ltr && \
  #  pwd && \
  #  cp -r neogym/* /var/www/html/


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

 
