pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ajith-devops/kubernetes.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }
    }
}