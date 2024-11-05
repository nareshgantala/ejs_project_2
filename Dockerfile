# Use a base image that supports Ansible installation
FROM ansible/ansible

# Set the working directory for the playbook
WORKDIR /home/centos/ejs_project_2

# Copy the Ansible playbook and any required files into the container
COPY setup_ejs.yml /home/centos/ejs_project_2/setup_ejs.yml
COPY app.js /home/centos/ejs_project_2/app.js
COPY views /home/centos/ejs_project_2/views
COPY ejs_project.service /home/centos/ejs_project_2/ejs_project.service

# Run Ansible playbook to set up the application (if you're using this as a build step)
# CMD executes this playbook within the container
CMD ["ansible-playbook", "-i", "localhost,", "-c", "local", "/home/centos/ejs_project/setup_ejs.yml"]

