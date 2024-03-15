pipeline {
    agent any 
    environment {
        Docker_image = 'lavkush1809/myimage'
        dockerImage = ''
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
                    dockerImage = docker.build(Docker_image)
                }
            }
        }
        stage('Deploy Image') {
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com/', 'dockerhub') {           
                        dockerImage.push("${env.BUILD_NUMBER}")            
                        dockerImage.push("latest")
                    }
                }
            }
        }
    }
}

