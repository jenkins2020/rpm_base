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
                dir("${MYHOME}") {
                    echo "yes, accessible"
                }
                sh("touch  ${MYHOME}/myfile")
                sh("ls -R ${MYHOME} ${env.WORKSPACE} || true")
                sh('rpmdev-setuptree')
                //sh("cd ${MYHOME}/rpmbuild/SOURCES; wget http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz")
                dir("${MYHOME}") {
                    dir ('rpmbuild/SOURCES/') {
                        sh('wget http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz')
                    }
                    dir('rpmbuild/SPECS/') {
                        sh('rpmdev-newspec hello')
                        archiveArtifacts(artifacts: '*.spec')
                        sh("cp ${env.WORKSPACE}/hello.spec .")
                    }
                }
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
