#/bin/bash

case "$1" in
    start)
        sh ./app start.ubuntu14
        sh ./app start.ubuntu16
    ;;

    start.ubuntu14)
        docker-compose pull
        docker-compose up --build --remove-orphans -d ubuntu14
        docker-compose exec ubuntu14 ansible --version
        docker-compose exec ubuntu14 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
    ;;

    start.ubuntu16)
        docker-compose pull
        docker-compose up --build --remove-orphans -d ubuntu16
        docker-compose exec ubuntu16 ansible --version
        docker-compose exec ubuntu16 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
    ;;

    stop)
        docker-compose down --remove-orphans
    ;;

    *)
        clear
        echo ""
        echo " Commands"
        echo ""
        echo " - start           Start all containers"
        echo " - start.ubuntu14  Start Ubuntu 14.04 container"
        echo " - start.ubuntu16  Start Ubuntu 16.04 container"
        echo " - stop            Stop all containers"
        echo ""
    ;;
esac