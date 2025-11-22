# This chooses a lightweight Linux image that already has Java 17 installed.
# Without Java, our Spring Boot app cannot run.
FROM openjdk:17-jdk-slim

# This creates/uses a folder named /app inside the container.
# All next commands will run inside this folder.
WORKDIR /app

# This copies the built jar file from your system (target folder)
# into the container and renames it to app.jar.
COPY target/*.jar app.jar

# This tells Docker that our Spring Boot app uses port 8080.
# Render or any cloud platform will know which port to expose.
EXPOSE 8080

# This is the command that runs when the container starts.
# Same as running: java -jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
