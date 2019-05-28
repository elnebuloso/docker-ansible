# docker-ansible

Base Ansible Container

## docker hub

See Supported Tags at https://hub.docker.com/r/elnebuloso/ansible/tags/

## development

```
docker-compose pull
docker-compose up --build --remove-orphans --force-recreate
docker-compose exec ansible ansible --version | grep -Po "^ansible (\d+\.)+\d+" | sed 's!ansible !!g'
docker-compose exec ubuntu18 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
docker-compose down --remove-orphans
```