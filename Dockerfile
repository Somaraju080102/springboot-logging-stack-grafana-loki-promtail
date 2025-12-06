FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY springapp.jar /app/springapp.jar

EXPOSE 8080

CMD ["java","-jar","/app/springapp.jar"]





