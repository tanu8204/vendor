
# Use the official OpenJDK 17 image as the base image
FROM adoptopenjdk/openjdk17:alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the compiled JAR file from the build stage to the container
COPY build/libs/Vendor-0.0.1-SNAPSHOT.jar app.jar

# Expose the port that your application runs on
EXPOSE 8082

# Command to run the application when the container starts
CMD ["java", "-jar", "app.jar"]
