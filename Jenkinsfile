#!/bin/groovy
pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
        }
    }

    environment {
        MYHOME = '/home/user'
    }

    stages {
        stage('Cleanup') {
            when { expression { fileExists('~/rpmbuild') } }
            steps {
                dir('~/rpmbuild') { deleteDir() }
            }
        }
        stage('Init') {
            steps {
                sh('rpmdev-setuptree')
                dir("${MYHOME}/rpmbuild/SOURCES") {
                    sh('wget http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz')
                }
                dir("${MYHOME}/rpmbuild/SPECS") {
                    sh('rpmdev-newspec hello')
                    archiveArtifacts(artifacts: '*.spec')
                    sh("cp ${env.WORKSPACE}/hello.spec .")
                }
                //sh('ls -R / || true')
            }
        }
        stage('Build') {
            steps {
                dir("${MYHOME}/rpmbuild/SPECS") {
                    sh('rpmbuild -ba hello.spec')
                }
            }
        }
    }
}
