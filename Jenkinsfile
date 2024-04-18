pipeline {
    agent any
    
    environment {
        DOCKER_HUB_USERNAME = 'lavkush1809'
        DOCKER_HUB_REPO = 'newimagerepo'
    }
 
    stages {
        stage("Code") {
            steps {
                echo "Cloning the code"
                git url: "https://github.com/Lavkush1809/Assignment-3.git", branch: "main"
            }
        }
 
        stage("Build my-react-app") {
            steps {
                script {
                    docker.build("${DOCKER_HUB_REPO}:${env.BUILD_NUMBER}")
                }
            }
        }
 
        stage("Push my-react-app-dev to Docker Hub") {
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


