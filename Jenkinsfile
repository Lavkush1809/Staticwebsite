pipeline {
    agent any 
    environment {
        Docker_repo = 'lavkush1809/newimage'
        registry_cred ='docker'
    }
    stages {
        stage('Pull') {
            steps {
                git branch: 'main', credentialsId: 'Lavkush1809', url: 'https://github.com/Lavkush1809/Staticwebsite.git'
            }
        }
        stage('Build Image') {
            steps {
                script {
                     docker.build("${DOCKER_HUB_REPO}:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Deploy Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKER_REGISTRY_CREDENTIALS}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    script {
                        docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_USERNAME}", "${DOCKER_PASSWORD}") {

                            docker.image("${DOCKER_HUB_REPO}:${env.BUILD_NUMBER}").push()
                        }
                    }

            }
        }
    }
}

