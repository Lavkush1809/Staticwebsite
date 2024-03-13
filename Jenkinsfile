pipleline{
  agent any 
  environment{
    Docker_id = 'lavkush1809'
    Docker_image = 'lavkush1809/myimage'
    dockerImage = ''
  }
  stages{
        stage('Pull') {
            steps {
                git branch: 'main', credentialsId: 'Lavkush1809', url: 'https://github.com/Lavkush1809/Staticwebsite.git'
            }
        }
        stage('Build Image'){
              steps{
                dockerImage = docker.build Docker_image
              }
        }
        stage('Deploy Image'){
            steps{
                   docker.withRegistry('https://registry.hub.docker.com', 'Docker_id')           
                   app.push("${env.BUILD_NUMBER}")            
                   app.push("latest")        
        }
    }
          
    }
      
}
