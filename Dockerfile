FROM openjdk-17-jdk-alpine
COPY target/demo-workshop-2.1.2.jar ttrend.jar
ENTRYPOINT [ "java", "-jar", "ttrend.jar" ]
