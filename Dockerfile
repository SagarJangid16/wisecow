# Use an official Ubuntu image as a parent image
FROM ubuntu:latest

# Install prerequisites
RUN apt-get update && apt-get install -y fortune-mod cowsay

# Copy the wisecow script to the container
COPY wisecow.sh /usr/local/bin/wisecow.sh
RUN chmod +x /usr/local/bin/wisecow.sh

# Expose the port the app runs on
EXPOSE 4499

# Run the wisecow script
CMD ["/usr/local/bin/wisecow.sh"]
