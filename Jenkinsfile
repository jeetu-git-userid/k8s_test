echo 'hello'
pipeline {
    environment {
        registry = "ilutdto353.corp.amdocs.com/sbafna/temp"
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
                    dockerImage=docker.build registry + ":$BUILD_NUMBER"
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
        stage('Deploy to k8s cluster') {
            steps { 
                sh "kubectl apply -f nodejs-html-k8s-deployment.yaml"
                sh "kubectl get deployments"
            }
        }
    }
}
