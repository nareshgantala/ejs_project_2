# Use a base image that supports Ansible installation
FROM ansible/ansible:default

# Verify Ansible installation (optional, for debugging)
RUN ansible --version

# Set the working directory for the playbook
WORKDIR /home/centos/ejs_project_2

# Copy the Ansible playbook and any required files into the container
COPY setup_ejs.yml /home/centos/ejs_project_2/setup_ejs.yml
COPY app.js /home/centos/ejs_project_2/app.js
COPY views /home/centos/ejs_project_2/views
COPY ejs_project.service /home/centos/ejs_project_2/ejs_project.service


# Ensure Ansible has a localhost inventory
RUN echo "localhost ansible_connection=local" > /etc/ansible/hosts

# Run Ansible playbook to set up the application (if you're using this as a build step)
# CMD executes this playbook within the container
CMD ["ansible-playbook", "-i", "localhost,", "-c", "local", "/home/centos/ejs_project_2/setup_ejs.yml"]

