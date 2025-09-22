FROM maven:3.8.7-eclipse-terumin-17 AS Build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM tomcat:9.0-jdk17-temurin
WORKDIR /usr/local/tomcat/webapps/
COPY --from=build /app/target/mywebapp.war ./mywebapp.wa
EXPOSE 8080
CMD ["catalina.sh" "run"]



