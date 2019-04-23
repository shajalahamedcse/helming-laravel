pipeline {
  environment {
    IMAGE_NAME = 'shajalahamedcse/laravel-docker'
    BUILD_ID = "latest"
    DOCKER_USERNAME = "shajalahamedcse"
    DOCKER_PASSWORD = ""
  }

  agent any

  stages {
    stage('Build') {
      steps {
        checkout scm
        sh '''
          docker build -t $IMAGE_NAME:$BUILD_ID .
        '''
      }
    }

    stage('Image Release') {

      steps {

          sh '''
            docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
            docker push $IMAGE_NAME:$BUILD_ID
          '''

      }
    }
    stage('Staging Deployment') {

      environment {
        RELEASE_NAME = 'laravelhello-staging'

      }
      steps {
        sh '''

          helm repo add laravel-docker-repo https://raw.githubusercontent.com/shajalahamedcse/helming-laravel/master/helm/laravel-docker/
          helm repo update
          helm repo list
          helm init --client-only
          helm install laravel-docker-repo/laravel-docker -n laravel --debug

        '''
      }
    }




  }
  }
