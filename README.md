# docker-ansible

![Release](https://github.com/elnebuloso/docker-ansible/workflows/Release/badge.svg)
[![Docker Pulls](https://img.shields.io/docker/pulls/elnebuloso/ansible.svg)](https://hub.docker.com/r/elnebuloso/ansible)
[![GitHub](https://img.shields.io/github/license/elnebuloso/docker-ansible.svg)](https://github.com/elnebuloso/docker-ansible)

Dockerized Ansible

## github

- https://github.com/elnebuloso/docker-ansible

## docker

- https://hub.docker.com/r/elnebuloso/ansible
- https://hub.docker.com/r/elnebuloso/ansible/tags

## about

Ansible is the simplest way to automate apps and IT infrastructure. 

Application Deployment + Configuration Management + Continuous Delivery.

## development

```
docker-compose pull
docker-compose up --build --remove-orphans --force-recreate -d
docker-compose run ansible --version
docker-compose run ansible ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
docker-compose down --remove-orphans
```
