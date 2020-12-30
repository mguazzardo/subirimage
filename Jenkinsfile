pipeline {
  environment {
    registry = "mguazzardo/curso-sc"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/mguazzardo/complejo.git'
      }
    }
    stage('Building image') {
      steps{
      	sh 'docker build -t centos7ssh .'
	}
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registry ) {

            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        //sh "docker rmi $registry:$BUILD_NUMBER"
        echo "Borrariamos la imagen pero cuando estemos seguro"
      }
    }
  }
}
