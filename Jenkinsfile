echo 'hello'
pipeline {
    environment {
        registryCredential = 'docker_nexus'
        dockerImage = ''
    }
    agent any
    stages {
        stage('Checkout k8s_test repo from GITHUB') {
            steps {
                git branch: 'master',
                credentialsId: 'jeetu-git-userid',
                url: 'https://github.com/jeetu-git-userid/k8s_test.git'
                sh "ls -lat"
            }
        }
        stage('Build Docker image') {
            steps {
                sh "whoami"
                script {
                    dockerImage=docker.build("ilutdto353.corp.amdocs.com/sbafna/temp")
                    sh "docker images | grep ilutdto353"
                }
            }
        }
        stage('Upload to Nexus') {
            steps {
                sh "date"
                script {
                    docker.withRegistry( 'http://ilutdto353.corp.amdocs.com', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }       
    }
}
