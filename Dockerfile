FROM tomcat:8.5-alpine
RUN apk add --no-cache openssh supervisor
ADD resources/supervisord.conf /etc/supervisord.conf
ADD resources/sshd_config /etc/ssh/sshd_config
ADD resources/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
RUN ssh-keygen -A && echo "root:xebialabs" | chpasswd


CMD ["/usr/bin/supervisord"]
EXPOSE 22 8080