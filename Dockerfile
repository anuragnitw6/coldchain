FROM openjdk:17-jdk-slim
WORKDIR /thingsboard
COPY . .
RUN ./mvnw clean install -DskipTests
CMD ["java", "-jar", "application/target/thingsboard.jar"]
