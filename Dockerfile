FROM openjdk:25-jdk-slim

# Create a user and group
RUN groupadd appgroup && useradd -r -g appgroup appuser

# Set working directory
WORKDIR /app

# Copy your jar into /app
COPY target/demo-workshop-2.1.2.jar ttrend.jar

# Change ownership so appuser can access files
RUN chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

# Run your app
ENTRYPOINT ["java", "-jar", "ttrend.jar"]
