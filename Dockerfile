FROM python:3.12.7-bullseye
RUN pip3.12 install ansible ansible-core==2.16 botocore boto3 python-jenkins
RUN ansible --version
WORKDIR /home/centos/ejs_project_2
COPY setup_ejs.yml /home/centos/ejs_project_2/setup_ejs.yml
COPY app.js /home/centos/ejs_project_2/app.js
COPY views /home/centos/ejs_project_2/views
COPY ejs_project.service /home/centos/ejs_project_2/ejs_project.service
RUN ansible-playbook -i localhost, -c local /home/centos/ejs_project_2/setup_ejs.yml
EXPOSE 3000
CMD ["node", "app.js"]

