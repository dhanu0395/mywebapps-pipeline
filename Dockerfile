# Build Stage
FROM maven:3.8.7-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Runtime Stage
FROM tomcat:9.0-jdk17-temurin
WORKDIR /usr/local/tomcat/webapps/
COPY --from=build /app/target/mywebapp.war ./mywebapp.war
EXPOSE 8080
CMD ["catalina.sh", "run"]



