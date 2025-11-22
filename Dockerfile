# ===== Stage 1: Build =====
# Use Maven + Java 17 to build the project
FROM maven:3.9.3-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build JAR without running tests
RUN mvn clean package -DskipTests

# ===== Stage 2: Run =====
# Use lightweight Java 17 image to run the app
FROM eclipse-temurin:17-jdk-slim

# Set working directory inside container
WORKDIR /app

# Copy the built JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose default Spring Boot port
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
