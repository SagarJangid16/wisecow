# Use the pre-built image as the base
FROM larv/fortunes-cowsay

# Copy your script into the container
COPY wisecow.sh /wisecow.sh

# Make your script executable
RUN chmod +x /wisecow.sh

# Set the default command to run your script
CMD ["/wisecow.sh"]
