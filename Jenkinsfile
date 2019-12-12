echo 'hello'
pipeline {
    agent any
    stages {
        stage('Checkout k8s_test.git') {
            steps {
                git branch: 'master',
                credentialsId: 'jeetu-git-userid',
                url: 'https://github.com/jeetu-git-userid/k8s_test.git'

                sh "ls -lat"
            }
        }
    }
}
