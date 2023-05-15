FROM  centos:latest
MAINTAINER n.haider@preqtec.com
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd zip unzip
COPY https://github.com/NasirHaider/k8s/tree/master/html /var/www/
WORKDIR /var/www/html/
#RUN unzip leadmark.zip
#RUN cp -rvf leadmark/* .
#RUN rm -rf leadmark leadmark.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
