# Use an official Node.js runtime as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /home/centos/ejs_project_2

# Copy the application files to the container
COPY app.js /home/centos/ejs_project_2/app.js
COPY views /home/centos/ejs_project_2/views

# Install Express and EJS dependencies
RUN npm install express ejs

# Expose port 3000 for the app
EXPOSE 3000

# Set the environment variable for the port
ENV PORT=3000

# Command to run the application
CMD ["node", "app.js"]
