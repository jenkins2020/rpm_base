pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
        }
    }

    stages {
        stage('Init') {
            steps {
                sh('rpmdev-setuptree')
                dir('~/rpmbuild/SOURCES') {
                    sh('wget http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz')
                }
                dir('~/rpmbuild/SPECS') {
                    sh('rpmdev-newspec hello')
                    archiveArtifacts(artifacts: '*.spec')
                }
                sh('ls -R /')
            }
        }
    }
}
