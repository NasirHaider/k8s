FROM  centos:latest
MAINTAINER n.haider@preqtec.com
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd
#RUN git clone https://github.com/NasirHaider/k8s.git /tmp/k8s
RUN ls -l ../html/
COPY ../html/* /var/www/html/
RUN ls -l /var/www/html/
WORKDIR /var/www/html/
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80   22
