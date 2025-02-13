pipeline {
    agent any
    environment {
        IMAGE_NAME = "flask-app"
        CONTAINER_NAME = "flask-container"
        DOCKER_TOOL = tool name: 'Docker' // Using Docker tool from Jenkins
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
            sh '"C:/Program Files/Docker/Docker/resources/bin/docker" build -t ${IMAGE_NAME} .'
        }
    }
}
        stage('Run Docker Container') {
            steps {
                script {
        "C:\Program Files\Docker\Docker\resources\bin\docker" run -d -p 5000:5000 --name flask-container flask-app
                }
            }
        }
        stage('Cleanup Old Containers') {
            steps {
                script {
                    sh '${DOCKER_TOOL}/docker rm -f ${CONTAINER_NAME} || true'
                }
            }
        }
    }
}
