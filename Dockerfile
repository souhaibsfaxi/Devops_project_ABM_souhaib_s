# Use the official OpenJDK base image
FROM openjdk:11-jre-slim

EXPOSE 8089

# Define the command to run your Spring Boot application
RUN apt-get update && apt-get install -y curl
RUN curl -o timesheet.jar -L "http://192.168.33.10:8081/repository/maven-releases/tn/esprit/DevOps_Project/2.1/DevOps_Project-2.1.jar"
ENTRYPOINT ["java", "-jar", "timesheet.jar"]
