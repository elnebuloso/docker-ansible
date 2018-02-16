#/bin/bash

case "$1" in
    start)
        sh ./app start.centos7
        sh ./app start.debian8
        sh ./app start.ubuntu14
        sh ./app start.ubuntu16
    ;;

    start.centos6)
        docker-compose pull
        docker-compose up --build --remove-orphans -d centos6
        docker-compose exec centos6 ansible --version | grep -Po "(\d+\.)+\d+
        docker-compose exec centos6 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
    ;;

    start.centos7)
        docker-compose pull
        docker-compose up --build --remove-orphans -d centos7
        docker-compose exec centos7 ansible --version
        docker-compose exec centos7 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
    ;;

    start.debian7)
        docker-compose pull
        docker-compose up --build --remove-orphans -d debian7
        docker-compose exec debian7 ansible --version
        docker-compose exec debian7 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
    ;;

    start.debian8)
        docker-compose pull
        docker-compose up --build --remove-orphans -d debian8
        docker-compose exec debian8 ansible --version
        docker-compose exec debian8 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
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
        docker-compose exec ubuntu16 ansible --versionn | grep -Po "(\d+\.)+\d+
        docker-compose exec ubuntu16 ansible-playbook -i 'localhost,' -c local /etc/ansible/roles/demo-role/tests/test.yml
    ;;

    stop)
        docker-compose down --remove-orphans
    ;;

    create)
        docker build --pull -t ansible-centos6-latest -f Dockerfile.centos6 .
        docker build --pull -t ansible-centos7-latest -f Dockerfile.centos7 .
        docker build --pull -t ansible-debian7-latest -f Dockerfile.debian7 .
        docker build --pull -t ansible-debian8-latest -f Dockerfile.debian8 .
        docker build --pull -t ansible-ubuntu14-latest -f Dockerfile.ubuntu14 .
        docker build --pull -t ansible-ubuntu16-latest -f Dockerfile.ubuntu16 .

        clear

        echo "centos6"
        docker run ansible-centos6-latest ansible --version
        echo ""

        echo "centos7"
        docker run ansible-centos7-latest ansible --version
        echo ""

        echo "debian7"
        docker run ansible-debian7-latest ansible --version
        echo ""

        echo "debian8"
        docker run ansible-debian8-latest ansible --version
        echo ""

        echo "ubuntu14"
        docker run ansible-ubuntu14-latest ansible --version
        echo ""

        echo "ubuntu16"
        docker run ansible-ubuntu16-latest ansible --version
        echo ""
    ;;

    push)
        clear

        echo "centos6"
        docker tag ansible-centos6-latest elnebuloso/ansible:2.4.1.0-centos6
        docker tag ansible-centos6-latest elnebuloso/ansible:2.4-centos6
        docker tag ansible-centos6-latest elnebuloso/ansible:2-centos6
        docker push elnebuloso/ansible:2.4.1.0-centos6
        docker push elnebuloso/ansible:2.4-centos6
        docker push elnebuloso/ansible:2-centos6
        docker run elnebuloso/ansible:2-centos6 ansible --version
        echo ""

        echo "centos7"
        docker tag ansible-centos7-latest elnebuloso/ansible:2.4.1.0-centos7
        docker tag ansible-centos7-latest elnebuloso/ansible:2.4-centos7
        docker tag ansible-centos7-latest elnebuloso/ansible:2-centos7
        docker push elnebuloso/ansible:2.4.1.0-centos7
        docker push elnebuloso/ansible:2.4-centos7
        docker push elnebuloso/ansible:2-centos7
        docker run elnebuloso/ansible:2-centos7 ansible --version
        echo ""

        echo "debian7"
        docker tag ansible-debian7-latest elnebuloso/ansible:2.4.2.0-debian7
        docker tag ansible-debian7-latest elnebuloso/ansible:2.4-debian7
        docker tag ansible-debian7-latest elnebuloso/ansible:2-debian7
        docker push elnebuloso/ansible:2.4.2.0-debian7
        docker push elnebuloso/ansible:2.4-debian7
        docker push elnebuloso/ansible:2-debian7
        docker run elnebuloso/ansible:2-debian7 ansible --version
        echo ""

        echo "debian8"
        docker tag ansible-debian8-latest elnebuloso/ansible:2.4.2.0-debian8
        docker tag ansible-debian8-latest elnebuloso/ansible:2.4-debian8
        docker tag ansible-debian8-latest elnebuloso/ansible:2-debian8
        docker push elnebuloso/ansible:2.4.2.0-debian8
        docker push elnebuloso/ansible:2.4-debian8
        docker push elnebuloso/ansible:2-debian8
        docker run elnebuloso/ansible:2-debian8 ansible --version
        echo ""

        echo "ubuntu14"
        docker tag ansible-ubuntu14-latest elnebuloso/ansible:2.4.2.0-ubuntu14
        docker tag ansible-ubuntu14-latest elnebuloso/ansible:2.4-ubuntu14
        docker tag ansible-ubuntu14-latest elnebuloso/ansible:2-ubuntu14
        docker push elnebuloso/ansible:2.4.2.0-ubuntu14
        docker push elnebuloso/ansible:2.4-ubuntu14
        docker push elnebuloso/ansible:2-ubuntu14
        docker run elnebuloso/ansible:2-ubuntu14 ansible --version
        echo ""

        echo "ubuntu16"
        docker tag ansible-ubuntu16-latest elnebuloso/ansible:2.4.2.0-ubuntu16
        docker tag ansible-ubuntu16-latest elnebuloso/ansible:2.4-ubuntu16
        docker tag ansible-ubuntu16-latest elnebuloso/ansible:2-ubuntu16
        docker push elnebuloso/ansible:2.4.2.0-ubuntu16
        docker push elnebuloso/ansible:2.4-ubuntu16
        docker push elnebuloso/ansible:2-ubuntu16
        docker run elnebuloso/ansible:2-ubuntu16 ansible --version
        echo ""
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
        echo "- stop            Stop all containers"
        echo "- create          Create Images"
        echo "- push            Push Images"
        echo ""
    ;;
esac