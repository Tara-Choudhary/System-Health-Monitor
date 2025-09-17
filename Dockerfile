FROM ubuntu:24.04

WORKDIR /app

# Copy the script into the container
COPY system_health_monitor.sh .

# Ensure it’s executable
RUN chmod +x system_health_monitor.sh

# Use CMD so you can override if needed
CMD ["bash", "system_health_monitor.sh"]

