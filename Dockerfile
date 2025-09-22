
# Runtime Stage
FROM tomcat:9.0-jdk17-temurin
WORKDIR /usr/local/tomcat/webapps/
COPY /target/mywebapp.war ./mywebapp.war
EXPOSE 8080
CMD ["catalina.sh", "run"]



