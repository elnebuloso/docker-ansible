# docker-ansible

[![Docker Build Statu](https://img.shields.io/docker/build/elnebuloso/ansible.svg)](https://hub.docker.com/r/elnebuloso/ansible/builds/)

The Main Purpose of this Container is for Developing and Testing Ansible Roles

## Ansible Version

- ubuntu14 - ansible `2.4.0.0`
- ubuntu16 - ansible `2.4.0.0`
- debian7 - ansible `2.4.0.0`
- debian8 - ansible `2.4.0.0`
- centos6 - ansible `2.3.2.0`
- centos7 - ansible `2.3.2.0`

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
docker-compose exec ubuntu14
docker-compose exec ubuntu14 ansible --version
docker-compose exec ubuntu14 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
```

```text
docker-compose exec ubuntu16
docker-compose exec ubuntu16 ansible --version
docker-compose exec ubuntu16 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
```

```text
docker-compose exec debian7
docker-compose exec debian7 ansible --version
docker-compose exec debian7 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
```

```text
docker-compose exec debian8
docker-compose exec debian8 ansible --version
docker-compose exec debian8 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
```

```text
docker-compose exec centos6
docker-compose exec centos6 ansible --version
docker-compose exec centos6 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
```

```text
docker-compose exec centos7
docker-compose exec centos7 ansible --version
docker-compose exec centos7 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
```