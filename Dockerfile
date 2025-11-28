# Docker Image which is used as foundation to create

# Use an official Node.js image as the base image
FROM node:21.1.0

# Create and change to the app directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json if they exist
COPY package*.json ./

# Install NVM and use Node.js version 16.15.1
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && . ~/.nvm/nvm.sh \
    && nvm install 21.1.0 \
    && nvm use 21.1.0 \
    && nvm alias default 21.1.0

# Verify npm version
RUN npm -v

# Install dependencies
RUN npm i -g mintlify

# Copy the rest of the application code
COPY . .

# Uses port which is used by the actual application
EXPOSE 3000
