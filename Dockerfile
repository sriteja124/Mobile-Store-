FROM openjdk:8-jdk-alpine
COPY target/mobilestore-0.0.1-SNAPSHOT.jar mobilestore-0.0.1-SNAPSHOT.jar
EXPOSE 8099
ENTRYPOINT ["java","-jar","/mobilestore-0.0.1-SNAPSHOT.jar"]
