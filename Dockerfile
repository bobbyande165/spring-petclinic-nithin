FROM eclipse-temurin:latest
EXPOSE 8080
ADD target/*.jar nithin.jar
ENTRYPOINT ["java","-jar","nithin.jar"]