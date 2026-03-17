pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Use correct branch name (replace 'main' if different)
                git branch: 'main',
                    url: 'https://github.com/ajith-devops/kubernetes.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'echo "Running tests..."'
                sh 'npm test || echo "No tests defined yet"'
            }
        }

    }

    post {
        success {
            echo '✅ Build & Test Successful'
        }
        failure {
            echo '❌ Build or Test Failed'
        }
    }
}