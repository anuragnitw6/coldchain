FROM openjdk:17-jdk-slim

# Install Maven, Node.js, Yarn, and build tools
RUN apt-get update && apt-get install -y curl gnupg2 git maven build-essential && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /thingsboard

# Copy all project files
COPY . .

# Build ThingsBoard (skip tests + license check)
RUN mvn clean install -DskipTests -Dlicense.skip=true

# Expose HTTP port
EXPOSE 8080

# Run ThingsBoard
CMD ["java", "-jar", "application/target/thingsboard.jar"]
