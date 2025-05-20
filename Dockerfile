FROM tomcat:9-jre9 
MAINTAINER "prakruthi07prakru@gmail.com"
COPY ./phonepe.war /usr/local/tomcat/webapps/ROOT.
EXPOSE 8081