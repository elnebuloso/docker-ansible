# docker-ansible

[![Build Status](https://travis-ci.com/elnebuloso/docker-ansible.svg?branch=master)](https://travis-ci.com/elnebuloso/docker-ansible)
[![Docker Pulls](https://img.shields.io/docker/pulls/elnebuloso/ansible.svg)](https://hub.docker.com/r/elnebuloso/ansible)
[![Docker Automated build](https://img.shields.io/docker/automated/elnebuloso/ansible.svg)](https://hub.docker.com/r/elnebuloso/ansible)

Dockerized Ansible

## about

Ansible is the simplest way to automate apps and IT infrastructure. Application Deployment + Configuration Management + Continuous Delivery.

## development

```
docker-compose pull
docker-compose up --build --remove-orphans --force-recreate -d
docker-compose exec ansible ansible --version
docker-compose exec ansible ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
docker-compose down --remove-orphans
```