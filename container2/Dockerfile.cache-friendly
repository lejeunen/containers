FROM maven:3.6.1-jdk-8-slim AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn -e -B dependency:resolve
COPY src ./src
RUN mvn -e -B package

FROM openjdk:8-jre-slim
COPY --from=builder /app/target/container2-0.0.1-SNAPSHOT.jar /
CMD ["java", "-jar", "/container2-0.0.1-SNAPSHOT.jar"]