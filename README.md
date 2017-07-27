# docker-ansible

[![Docker Build Statu](https://img.shields.io/docker/build/elnebuloso/ansible.svg)](https://hub.docker.com/r/elnebuloso/ansible/builds/)


## Supported tags and respective `Dockerfile` links

- [`ubuntu14` (Dockerfile.ubuntu14)](https://github.com/elnebuloso/docker-ansible/blob/master/Dockerfile.ubuntu14)
- [`ubuntu16` (Dockerfile.ubuntu16)](https://github.com/elnebuloso/docker-ansible/blob/master/Dockerfile.ubuntu16)


## Containers

- https://hub.docker.com/r/elnebuloso/ansible/tags/


### ubuntu14

- elnebuloso/ansible:ubuntu14-latest
- elnebuloso/ansible:ubuntu14-`[version]`


### ubuntu16

- elnebuloso/ansible:ubuntu16-latest
- elnebuloso/ansible:ubuntu16-`[version]`


## Developing this Container


### start and build containers

```text
docker-compose up --build -d
docker-compose up --build -d ubuntu14
docker-compose up --build -d ubuntu16
```


### exec into running containers

```text
docker-compose exec ubuntu14 bash
docker-compose exec ubuntu16 bash
```