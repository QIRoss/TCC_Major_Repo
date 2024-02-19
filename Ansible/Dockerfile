FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    ansible \
    ssh \
    && rm -rf /var/lib/apt/lists/*

COPY playbook-deploy.yml /playbook-deploy.yml

WORKDIR /ansible

CMD ansible-playbook -i localhost, /playbook-deploy.yml
