pipeline {
  
  agent any
  
  environment {
      DOCKERHUB_CREDENTIALS=credentials('dockerhub-sriteja')
  }
 
   
  stages {
       stage('Gitlab'){               
                steps{
                    git branch: 'main', url: 'https://github.com/sriteja124/Mobile-Store-.git'
            }
        }
       stage('build'){
           steps{
               echo 'building the project'
               sh 'mvn clean install'
               }
          
       }
       stage('docker-image'){
           steps{
               echo "Building docker image"
                script{
                  sh 'docker build -t mobilestore .'
                }
               }
       }
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password Sriteja124@'
            }
        }
        stage('push') {
            steps {
                sh 'docker tag mobilestore:latest sriteja021/mobilestore:latest'
                sh 'docker push sriteja021/mobilestore:latest'
            }
        }
        stage('deployment'){
           steps{
               echo "deploy to dev stage"
                script{
                  sh 'docker run -d -p 8099:8099 --name=mobilestore sriteja021/mobilestore:latest'
                }
               }  
       }
  }
}
