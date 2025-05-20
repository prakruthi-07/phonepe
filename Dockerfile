FROM tomcat:9-jre9 
MAINTAINER "prakruthi07prakru@gmail.com"
COPY ./Snapchat.war /usr/local/tomcat/webapps/ROOT.
EXPOSE 8081

