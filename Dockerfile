FROM eclipse-temurin:latest
EXPOSE 8080
ADD target/spring-petclinic-4.0.0-SNAPSHOT.jar nithin.jar
ENTRYPOINT ["java","-jar","nithin.jar"]