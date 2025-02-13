pipeline {
    agent any
    environment {
        IMAGE_NAME = "flask-app"
        CONTAINER_NAME = "flask-container"
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
                    bat '"C:/Program Files/Docker/Docker/resources/bin/docker" build -t %IMAGE_NAME% .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    bat '"C:/Program Files/Docker/Docker/resources/bin/docker" run -d -p 5000:5000 --name %CONTAINER_NAME% %IMAGE_NAME%'
                }
            }
        }
        stage('Cleanup Old Containers') {
            steps {
                script {
                    bat '"C:/Program Files/Docker/Docker/resources/bin/docker" rm -f %CONTAINER_NAME% || exit 0'
                }
            }
        }
    }
}
