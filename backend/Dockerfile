FROM gradle:8.6-jdk21 AS build
WORKDIR /home/gradle/src
COPY . .
RUN gradle --no-daemon clean shadowJar -x test

FROM eclipse-temurin
WORKDIR /app
COPY --from=build /home/gradle/src/build/libs/light-backend.jar /app/app.jar

EXPOSE 8080
CMD ["java", "-jar", "/app/app.jar"]
