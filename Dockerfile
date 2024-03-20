# Use the official OpenJDK 17 image as the base image for building
FROM gradle:jdk17 as builder

# Set the working directory inside the container
WORKDIR /app

# Copy the project files
COPY . .

# Build the JAR file
RUN gradle build

# Use a lightweight base image for the runtime environment
FROM openjdk:17-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the compiled JAR file from the build stage to the container
COPY --from=builder /app/build/libs/Vendor-0.0.1-SNAPSHOT.jar app.jar

# Expose the port that your application runs on
EXPOSE 8080

# Command to run the application when the container starts
CMD ["java", "-jar", "app.jar"]
