# docker-ansible

[![Docker Build Statu](https://img.shields.io/docker/build/elnebuloso/ansible.svg)](https://hub.docker.com/r/elnebuloso/ansible/builds/)

The Main Purpose of this Container is for Developing and Testing Ansible Roles

## Ansible Version

- ubuntu14 - ansible `2.3.1.0`
- ubuntu16 - ansible `2.3.1.0`
- centos7 - ansible `2.3.1.0`

## Supported tags and respective `Dockerfile` links

- [`ubuntu14` (Dockerfile.ubuntu14)](https://github.com/elnebuloso/docker-ansible/blob/master/Dockerfile.ubuntu14)
- [`ubuntu16` (Dockerfile.ubuntu16)](https://github.com/elnebuloso/docker-ansible/blob/master/Dockerfile.ubuntu16)
- https://hub.docker.com/r/elnebuloso/ansible/tags/

## Development

### build containers

```text
docker-compose up --build -d
```

### test containers

```text
docker-compose run ubuntu14
docker-compose run ubuntu14 ansible --version
docker-compose run ubuntu14 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
```

```text
docker-compose run ubuntu16
docker-compose run ubuntu16 ansible --version
docker-compose run ubuntu16 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
```

```text
docker-compose run centos6
docker-compose run centos6 ansible --version
docker-compose run centos6 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
```

```text
docker-compose run centos7
docker-compose run centos7 ansible --version
docker-compose run centos7 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
```