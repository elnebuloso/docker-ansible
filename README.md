# docker-ansible

Base Ansible Container

## docker hub

See Supported Tags at https://hub.docker.com/r/elnebuloso/ansible/tags/

## development

```
docker-compose pull
docker-compose up --build --remove-orphans --force-recreate -d
docker-compose exec ansible ansible --version
docker-compose exec ansible ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
docker-compose down --remove-orphans
```