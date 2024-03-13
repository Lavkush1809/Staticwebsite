pipleline{
  agent any 
  environment{
    Docker_id = 'Docker_cred'
    Docker_image = 'lavkush1809/myimage'
    Tag = 'v1'
  }
  stages{
        stage('Pull') {
            steps {
                git branch: 'main', credentialsId: 'Lavkush1809', url: ''
            }
        }
        
  }
}
