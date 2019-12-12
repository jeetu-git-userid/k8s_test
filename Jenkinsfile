echo 'hello'
pipeline {
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
                    docker.build("ilutdto353.corp.amdocs.com/sbafna/temp")
                }
            }
        }
    }
}
