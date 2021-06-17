FROM centos:7
RUN yum -y install epel-release
RUN yum -y update
RUN yum -y install nginx
WORKDIR /usr/share/nginx/html/
EXPOSE 80/tcp
CMD ["nginx", "-g daemon off;"]
