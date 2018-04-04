pipeline {
    agent any

	stages {
        stage('build centos6') {
            steps {
                script {
                    os = "centos6"

                    image = docker.build("elnebuloso/ansible:${os}", "--pull --rm --no-cache -f Dockerfile.${os} .")

                    image.inside() {
                        ansible_version = sh(script: "ansible --version | grep -Po '^ansible (\\d+\\.)+\\d+' | sed 's!ansible !!g'", returnStdout: true).trim()
                    }

                    semver = semver(ansible_version)

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${semver.get('tag_patch')}-${os}")
                        image.push("${semver.get('tag_minor')}-${os}")
                        image.push("${semver.get('tag_major')}-${os}")
                    }
                }
            }
        }

        stage('build centos7') {
            steps {
                script {
                    os = "centos7"

                    image = docker.build("elnebuloso/ansible:${os}", "--pull --rm --no-cache -f Dockerfile.${os} .")

                    image.inside() {
                        ansible_version = sh(script: "ansible --version | grep -Po '^ansible (\\d+\\.)+\\d+' | sed 's!ansible !!g'", returnStdout: true).trim()
                    }

                    semver = semver(ansible_version)

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${semver.get('tag_patch')}-${os}")
                        image.push("${semver.get('tag_minor')}-${os}")
                        image.push("${semver.get('tag_major')}-${os}")
                    }
                }
            }
        }

        stage('build debian7') {
            steps {
                script {
                    os = "debian7"

                    image = docker.build("elnebuloso/ansible:${os}", "--pull --rm --no-cache -f Dockerfile.${os} .")

                    image.inside() {
                        ansible_version = sh(script: "ansible --version | grep -Po '^ansible (\\d+\\.)+\\d+' | sed 's!ansible !!g'", returnStdout: true).trim()
                    }

                    semver = semver(ansible_version)

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${semver.get('tag_patch')}-${os}")
                        image.push("${semver.get('tag_minor')}-${os}")
                        image.push("${semver.get('tag_major')}-${os}")
                    }
                }
            }
        }

        stage('build debian8') {
            steps {
                script {
                    os = "debian8"

                    image = docker.build("elnebuloso/ansible:${os}", "--pull --rm --no-cache -f Dockerfile.${os} .")

                    image.inside() {
                        ansible_version = sh(script: "ansible --version | grep -Po '^ansible (\\d+\\.)+\\d+' | sed 's!ansible !!g'", returnStdout: true).trim()
                    }

                    semver = semver(ansible_version)

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${semver.get('tag_patch')}-${os}")
                        image.push("${semver.get('tag_minor')}-${os}")
                        image.push("${semver.get('tag_major')}-${os}")
                    }
                }
            }
        }

        stage('build ubuntu14') {
            steps {
                script {
                    os = "ubuntu14"

                    image = docker.build("elnebuloso/ansible:${os}", "--pull --rm --no-cache -f Dockerfile.${os} .")

                    image.inside() {
                        ansible_version = sh(script: "ansible --version | grep -Po '^ansible (\\d+\\.)+\\d+' | sed 's!ansible !!g'", returnStdout: true).trim()
                    }

                    semver = semver(ansible_version)

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${semver.get('tag_patch')}-${os}")
                        image.push("${semver.get('tag_minor')}-${os}")
                        image.push("${semver.get('tag_major')}-${os}")
                    }
                }
            }
        }

        stage('build ubuntu16') {
            steps {
                script {
                    os = "ubuntu16"

                    image = docker.build("elnebuloso/ansible:${os}", "--pull --rm --no-cache -f Dockerfile.${os} .")

                    image.inside() {
                        ansible_version = sh(script: "ansible --version | grep -Po '^ansible (\\d+\\.)+\\d+' | sed 's!ansible !!g'", returnStdout: true).trim()
                    }

                    semver = semver(ansible_version)

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${semver.get('tag_patch')}-${os}")
                        image.push("${semver.get('tag_minor')}-${os}")
                        image.push("${semver.get('tag_major')}-${os}")
                    }
                }
            }
        }
	}

	post {
	    always {
            cleanWs()
	    }
	}
}

/**
 * @var string version
 * @return map
 */
def semver(version) {
    def versionParts = version.tokenize('.')

    if (versionParts.size < 3) {
        throw new IllegalArgumentException("Wrong version format - expected MAJOR.MINOR.PATCH - got ${version}")
    }

    def major = versionParts[0].toInteger()
    def minor = versionParts[1].toInteger()
    def patch = versionParts[2].toInteger()

    def tag_major = "${major}"
    def tag_minor = "${major}.${minor}"
    def tag_patch = "${major}.${minor}.${patch}"

    def map = [tag_major: tag_major, tag_minor: tag_minor, tag_patch: tag_patch]

    return map
}