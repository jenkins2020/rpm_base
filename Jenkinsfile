#!/bin/groovy
pipeline {
    agent {
        dockerfile {
            filename 'Dockerfile'
        }
    }

    stages {
        stage('Build') {
            steps {
                sh("make init")
                // TODO archiveArtifacts(artifacts: '*.spec')
                sh("make build")
            }
        }
    }
}
