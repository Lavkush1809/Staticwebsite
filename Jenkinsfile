pipeline {
    agent any
    
    environment {
        DOCKER_HUB_USERNAME = 'lavkush1809'
        DOCKER_HUB_REPO = 'newimagerepo'
    }
 
    stages {
        stage("Pull the code ") {
            steps {
                echo "Cloning the code"
                git url: "https://github.com/Lavkush1809/Staticwebsite.git", branch: "main"
            }
        }
 
        stage("Build image") {
            steps {
                script {                    
                    sh "docker build -t ${DOCKER_HUB_USERNAME}/${DOCKER_HUB_REPO}:${env.BUILD_NUMBER} ."
                }
            }
        }
 
        stage("Push image to Docker Hub") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                    sh 'echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin'
                }
                echo "Pushing the image to Docker Hub"
                sh "docker push ${DOCKER_HUB_USERNAME}/${DOCKER_HUB_REPO}:${env.BUILD_NUMBER}"
            }
        }
    }
}


