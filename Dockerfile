# Use Amazon Linux as the base image
FROM public.ecr.aws/amazonlinux/amazonlinux:latest

# Install Node.js and npm
RUN yum update -y && \
    yum install -y nodejs npm

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the application port (if needed)
EXPOSE 3000

# Command to start the application
CMD ["node", "server.js"]
