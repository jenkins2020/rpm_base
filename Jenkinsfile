#!/bin/groovy
pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
        }
    }

    stages {
        stage('Init') {
            steps {
                dir("${env.HOME}") {
                    sh('rpmdev-setuptree')
                }
                dir("${env.HOME}/rpmbuild/SOURCES") {
                    sh('wget http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz')
                }
                dir("${env.HOME}/rpmbuild/SPECS") {
                    sh('rpmdev-newspec hello')
                    archiveArtifacts(artifacts: '*.spec')
                    sh("cp ${env.WORKSPACE}/hello.spec .")
                }
                //sh('ls -R / || true')
            }
        }
        stage('Build') {
            steps {
                dir("${env.HOME}/rpmbuild/SPECS") {
                    sh('rpmbuild -ba hello.spec')
                }
            }
        }
    }
}
