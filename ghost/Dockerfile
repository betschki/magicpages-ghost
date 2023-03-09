FROM node:16-bullseye

# Create ghost-user
RUN useradd -m -s /bin/bash ghost-user

# Install sudo
RUN apt-get update && apt-get install -y sudo

# Add ghost-user to sudoers
RUN echo "ghost-user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install Ghost
RUN npm install -g ghost-cli@latest

# Switch to ghost-user
USER ghost-user

# Create ghost directory
RUN sudo mkdir -p /var/www/ghost

# Switch to ghost directory
WORKDIR /var/www/ghost

# Copy ghost-5.37.0.tgz
COPY ghost-5.37.0.tgz /tmp

# Add permissions to ghost-user
RUN sudo chown -R ghost-user:ghost-user /var/www/ghost \
    && sudo chmod 775 /var/www/ghost

# Install Ghost from ghost-5.37.0.tgz
RUN ghost install --archive /tmp/ghost-5.37.0.tgz --no-prompt --no-setup --no-start

# create a JSON file with the configuration
RUN echo '{ \
  "url": "http://test.com", \
  "database": { \
    "client": "mysql", \
    "connection": { \
      "host": "${database__connection__host}", \
      "port": "${database__connection__port}", \
      "user": "${database__connection__user}", \
      "password": "${database__connection__password}", \
      "database": "${database__connection__database}" \
    } \
  }, \
  "server": { \
    "host": "0.0.0.0", \
    "port": 2368 \
  } \
} \
' > config.production.json

EXPOSE 2368