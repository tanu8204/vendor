# Use the official Gradle image with OpenJDK 17 as the base image for building
FROM gradle:jdk17 as builder

# Set the working directory inside the container for the build stage
WORKDIR /app

# Copy the project files
COPY . .

# Build the JAR file
RUN gradle build

# Use a lightweight base image for the runtime environment
FROM openjdk:17-alpine

# Set the working directory inside the container for the runtime stage
WORKDIR /app

# Copy the compiled JAR file from the build stage to the container
COPY --from=builder /app/build/libs/vendor-0.0.1-SNAPSHOT.jar app.jar

# Expose the port that your application runs on
EXPOSE 8082

# Command to run the application when the container starts
CMD ["java", "-jar", "app.jar"]
