FROM openjdk:17-jdk-slim

# Install Maven
RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /thingsboard

# Copy all files
COPY . .

# Build the project
RUN mvn clean install -DskipTests

# Run the ThingsBoard JAR
CMD ["java", "-jar", "application/target/thingsboard.jar"]
