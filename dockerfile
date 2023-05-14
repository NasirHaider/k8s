FROM  centos:latest
MAINTAINER vikashashoke@gmail.com
RUN yum install -y httpd zip unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page282/leadmark.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip leadermark.zip
RUN cp -rvf leadermark/* .
RUN rm -rf leadermark leadermark.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
