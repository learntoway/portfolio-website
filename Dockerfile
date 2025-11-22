# ===== Stage 1: Build =====
# Use Maven + Java 17 to build the project
FROM maven:3.9.3-eclipse-temurin-17 AS build
WORKDIR /app

# Copy pom.xml and download dependencies (offline)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build JAR without running tests
RUN mvn clean package -DskipTests

# ===== Stage 2: Run =====
# Use a real, existing OpenJDK 17 lightweight image
FROM openjdk:17-jdk-slim-bullseye
WORKDIR /app

# Copy the JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose default Spring Boot port
EXPOSE 8080

# Run Spring Boot
ENTRYPOINT ["java", "-jar", "app.jar"]
