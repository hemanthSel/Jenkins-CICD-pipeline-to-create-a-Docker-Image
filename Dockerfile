FROM ubuntu:latest
MAINTAINER hemanthdev22@gmail.com

# Update package lists
RUN apt-get update

# Install Java 17
RUN apt-get install -y openjdk-17-jdk

# Install Apache2 and utilities
RUN apt-get install -y apache2 apache2-utils

# Install unzip and wget
RUN apt-get install -y unzip wget

# Download Neogym template
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip

# Unzip the template
RUN unzip -u neogym.zip

# Copy website files to Apache document root
RUN cp -r neogym-html/* /var/www/html/

# Remove the zip file
RUN rm neogym.zip

# Set Apache document root to /var/www/html (adjust if needed)
RUN sed -i 's|DocumentRoot "/var/www/html"|DocumentRoot "/var/www/html"|g' /etc/apache2/apache2.conf
RUN sed -i 's|<Directory "/var/www/html">|<Directory "/var/www/html">|g' /etc/apache2/apache2.conf

# Enable necessary Apache modules (if needed)
# RUN a2enmod rewrite headers

# Set environment variable to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]



 
