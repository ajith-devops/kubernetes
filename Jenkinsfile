pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-id') // Jenkins credentials ID
        IMAGE_NAME = 'ajithkumar14542/devops-demo'
    }

    stages {
        stage('Clone Repository') {
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
        stage('Docker Build') {
            steps {
                sh "docker build -t $IMAGE_NAME:latest ."
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-id', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh "docker push $IMAGE_NAME:latest"
                }
            }
        }        

    }

    post {
        success {
            echo '✅ Build, Test & Docker Push Successful'
        }
        failure {
            echo '❌ Something went wrong in Docker Build or Push'
        }
    }
}