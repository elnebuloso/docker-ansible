pipeline {
    agent any

	stages {
        stage('build ubuntu14') {
            steps {
                script {
                    os = "ubuntu14"

                    image = docker.build("elnebuloso/ansible:${os}", "--pull --rm -f Dockerfile.${os} .")

                    image.inside() {
                        ansible_version = sh(script: "ansible --version | grep -Po '^ansible (\\d+\\.)+\\d+' | sed 's!ansible !!g'", returnStdout: true).trim()
                    }

                    semver = semver(ansible_version)

                    echo "${semver.get('tag_revision')}-${os}"
                    echo "${semver.get('tag_minor')}-${os}"
                    echo "${semver.get('tag_major')}-${os}"
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
    def parser = /(?<major>\d+).(?<minor>\d+).(?<revision>\d+).(?<bugfix>\d+)/
    def match = (version =~ parser)

    if(match.matches()) {
        def major = match[0][1]
        def minor = match[0][2]
        def revision = match[0][3]
        def bugfix = match[0][4]

        def tag_major = "${major}"
        def tag_minor = "${major}.${minor}"
        def tag_revision = "${major}.${minor}.${revision}"
        def tag_bugfix = "${major}.${minor}.${revision}.${bugfix}"

        match = null

        def map = [tag_major: tag_major, tag_minor: tag_minor, tag_revision: tag_revision, tag_bugfix: tag_bugfix]

        return map
    }
}