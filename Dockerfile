## Simple webserver container 
# Using RHEL 7 base image and Apache Web server
# Version 1

# Pull the rhel image from the local repository
FROM registry.access.redhat.com/ubi8/ubi
MAINTAINER <admin@example.com>

### Add Atomic/OpenShift Labels - https://github.com/projectatomic/ContainerApplicationGenericLabels#####
LABEL name="testwebserver" \
      vendor="Example Inc" \
      version="1.0" \
      release="1" \
      run='docker run -d -p 8080:80 --name=testweb testwebserver' \
      summary="Example Starter app" \
      description="Starter app will do ....."

COPY licenses /licenses

#RUN yum update -y
RUN yum install httpd -y

RUN echo "This container image was build on:" > /var/www/html/index.html
RUN date >> /var/www/html/index.html
EXPOSE 8080

# Start the service
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]

