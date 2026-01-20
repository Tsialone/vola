# Étape 1 : Build Maven sur JDK 21
FROM eclipse-temurin:21-jdk AS build
WORKDIR /app

# Installer Maven
RUN apt-get update && apt-get install -y maven

# Copier le code
COPY pom.xml .
COPY src ./src

# Build le projet (skip tests pour aller plus vite)
RUN mvn clean package -DskipTests

# Étape 2 : Tomcat
FROM tomcat:10.1-jdk21
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/target/*.jar /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
