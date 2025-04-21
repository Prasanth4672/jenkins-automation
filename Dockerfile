FROM eclipse-temurin:17-jre
WORKDIR /app
COPY target/devops-integration.jar devops-integration.jar
ENTRYPOINT ["java", "-jar", "/devops-integration.jar"]
EXPOSE 9090