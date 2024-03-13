pipeline {
    agent any 
    environment {
        Docker_id = 'lavkush1809'
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
                    docker.withRegistry('https://registry.hub.docker.com', 'Docker_id') {           
                        dockerImage.push("${env.BUILD_NUMBER}")            
                        dockerImage.push("latest")
                    }
                }
            }
        }
    }
}

