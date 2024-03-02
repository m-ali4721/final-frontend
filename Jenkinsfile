pipeline {
    agent any

    environment {
        dockerImage =''
        registry = 'makbar4721/dicea3'
        DOCKER_USER = 'DOCKER_USER'
        DOCKER_PASS = credentials('DOCKER_PASS') 
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Images') {
            steps {
                script {
                    sh "docker-compose build"
                }
            }
        }

        stage('Tag and Push Docker Images') {
            steps {
                script {
                    sh "docker tag nginx $DOCKER_USER/nginx:latest"
                    sh "docker login -u $DOCKER_USER -p $DOCKER_PASS"
                    sh "docker push $DOCKER_USER/nginx:latest"

                    sh "docker tag prom/prometheus $DOCKER_USER/prometheus:latest"
                    sh "docker push $DOCKER_USER/prometheus:latest"

                    sh "docker tag grafana/grafana $DOCKER_USER/grafana:latest"
                    sh "docker push $DOCKER_USER/grafana:latest"
                }
            }
        }

        stage('Deploy Docker Compose') {
            steps {
                script {
                    sh "docker-compose up -d"
                }
            }
        }
    }

    post {
        success {
            echo "Docker Compose deployment completed successfully!"
        }
        failure {
            echo "Docker Compose deployment failed! Please check the logs for details."
        }
    }
}
