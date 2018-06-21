#/bin/bash

case "$1" in
    start)
        sh ./app start.centos6
        sh ./app start.centos7
        sh ./app start.debian7
        sh ./app start.debian8
        sh ./app start.ubuntu14
        sh ./app start.ubuntu16
        sh ./app start.ubuntu18
    ;;

    start.centos6)
        docker-compose pull
        docker-compose up --build --remove-orphans --force-recreate -d centos6
        docker-compose exec centos6 ansible --version | grep -Po "^ansible (\d+\.)+\d+" | sed 's!ansible !!g'
        docker-compose exec centos6 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
    ;;

    start.centos7)
        docker-compose pull
        docker-compose up --build --remove-orphans --force-recreate -d centos7
        docker-compose exec centos7 ansible --version | grep -Po "^ansible (\d+\.)+\d+" | sed 's!ansible !!g'
        docker-compose exec centos7 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
    ;;

    start.debian7)
        docker-compose pull
        docker-compose up --build --remove-orphans --force-recreate -d debian7
        docker-compose exec debian7 ansible --version | grep -Po "^ansible (\d+\.)+\d+" | sed 's!ansible !!g'
        docker-compose exec debian7 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
    ;;

    start.debian8)
        docker-compose pull
        docker-compose up --build --remove-orphans --force-recreate -d debian8
        docker-compose exec debian8 ansible --version | grep -Po "^ansible (\d+\.)+\d+" | sed 's!ansible !!g'
        docker-compose exec debian8 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
    ;;

    start.ubuntu14)
        docker-compose pull
        docker-compose up --build --remove-orphans --force-recreate -d ubuntu14
        docker-compose exec ubuntu14 ansible --version | grep -Po "^ansible (\d+\.)+\d+" | sed 's!ansible !!g'
        docker-compose exec ubuntu14 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
    ;;

    start.ubuntu16)
        docker-compose pull
        docker-compose up --build --remove-orphans --force-recreate -d ubuntu16
        docker-compose exec ubuntu16 ansible --version | grep -Po "^ansible (\d+\.)+\d+" | sed 's!ansible !!g'
        docker-compose exec ubuntu16 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
    ;;

    start.ubuntu18)
        docker-compose pull
        docker-compose up --build --remove-orphans --force-recreate -d ubuntu18
        docker-compose exec ubuntu18 ansible --version | grep -Po "^ansible (\d+\.)+\d+" | sed 's!ansible !!g'
        docker-compose exec ubuntu18 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
    ;;

    stop)
        docker-compose down --remove-orphans
    ;;

    *)
        clear
        echo ""
        echo "- start           Start all containers"
        echo "- start.centos6   Start Centos 6 container"
        echo "- start.centos7   Start Centos 7 container"
        echo "- start.debian7   Start Debian 7 container"
        echo "- start.debian8   Start Debian 8 container"
        echo "- start.ubuntu14  Start Ubuntu 14.04 container"
        echo "- start.ubuntu16  Start Ubuntu 16.04 container"
        echo "- start.ubuntu18  Start Ubuntu 18.04 container"
        echo "- stop            Stop all containers"
        echo ""
    ;;
esac