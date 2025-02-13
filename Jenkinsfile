pipeline {
    agent any
    environment {
        IMAGE_NAME = "flask-app"
        CONTAINER_NAME = "flask-container"
        DOCKER_PATH = '"C:/Program Files/Docker/Docker/resources/bin/docker.exe"' // Ensure correct Docker path
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', 
                    credentialsId: 'github-username-PAT', 
                    url: 'https://github.com/Thirishaa/flask-jenkins-docker-cicd'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    bat "${DOCKER_PATH} build -t ${IMAGE_NAME}:latest ."
                }
            }
        }
        stage('Deploy Locally') {
            steps {
                script {
                    // Stop and remove existing container if running
                    bat "${DOCKER_PATH} stop ${CONTAINER_NAME} || exit 0"
                    bat "${DOCKER_PATH} rm ${CONTAINER_NAME} || exit 0"
                    
                    // Run new container
                    bat "${DOCKER_PATH} run -d --name ${CONTAINER_NAME} -p 5000:5000 ${IMAGE_NAME}:latest"
                }
            }
        }
        stage('Cleanup Old Images') {
            steps {
                script {
                    bat "${DOCKER_PATH} system prune -f"
                }
            }
        }
    }
}
