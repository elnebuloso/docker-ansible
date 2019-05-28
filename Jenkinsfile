pipeline {
    agent any

	stages {
        stage('build') {
            steps {
                script {
                    image = docker.build("elnebuloso/ansible:", "--pull --rm --no-cache -f Dockerfile .")
                    image.inside() {
                        ansible_version = sh(script: "ansible --version | grep -Po '^ansible (\\d+\\.)+\\d+' | sed 's!ansible !!g'", returnStdout: true).trim()
                    }

                    semver = semver(ansible_version)

                    docker.withRegistry("https://registry.hub.docker.com", '061d45cc-bc11-4490-ac21-3b2276f1dd05'){
                        image.push("${semver.get('tag_patch')}")
                        image.push("${semver.get('tag_minor')}")
                        image.push("${semver.get('tag_major')}")
                        image.push();
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
    println "${version}"

    def versionParts = version.tokenize('.')

    def major = versionParts[0].toInteger()
    def minor = versionParts[1].toInteger()
    def patch = versionParts[2].toInteger()

    def tag_major = "${major}"
    def tag_minor = "${major}.${minor}"
    def tag_patch = "${major}.${minor}.${patch}"

    def map = [tag_major: tag_major, tag_minor: tag_minor, tag_patch: tag_patch]

    return map
}