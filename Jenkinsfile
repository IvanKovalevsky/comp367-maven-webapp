pipeline {
    agent any

    environment {
        IMAGE_NAME = "ivankov123/comp367-maven-webapp"
        IMAGE_TAG = "latest"
        DOCKER_CREDS = credentials('dockerhub-creds')
    }

    stages {
        stage('Check out') {
            steps {
                git branch: 'main', url: 'https://github.com/IvanKovalevsky/comp367-maven-webapp'
            }
        }

        stage('Build Maven Project') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Login') {
            steps {
                bat 'echo %DOCKER_CREDS_PSW% | docker login -u %DOCKER_CREDS_USR% --password-stdin'
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t %IMAGE_NAME%:%IMAGE_TAG% .'
            }
        }

        stage('Docker Push') {
            steps {
                bat 'docker push %IMAGE_NAME%:%IMAGE_TAG%'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
    }
}
