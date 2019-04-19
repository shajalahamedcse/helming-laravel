pipeline {
  environment {
    IMAGE_NAME = 'shajalahamedcse/laravel-docker'
    BUILD_ID = "latest"
    DOCKER_USERNAME = "shajalahamedcse"
    DOCKER_PASSWORD = "sha01688459466"
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
    /*
      when {
        expression { env.BRANCH_NAME == 'master' }
      }
      */
      steps {

          sh '''
            docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
            docker push $IMAGE_NAME:$BUILD_ID
          '''

      }
    }
    stage('Staging Deployment') {
      /*
      when {
        expression { env.BRANCH_NAME == 'master' }
      }
      */
      environment {
        RELEASE_NAME = 'laravelhello-staging'

      }
      steps {
        sh '''

          helm repo add laravel-docker-repo https://github.com/shajalahamedcse/helming-laravel/tree/master/helm/laravel-docker
          helm repo update
          helm repo list
          helm install laravel-docker-repo/laravel-docker --n laravel --debug

        '''
      }
    }

    /*
    stage('Deploy to Production?') {
      when {
        expression { env.BRANCH_NAME == 'master' }
      }
      steps {
        // Prevent any older builds from deploying to production
        milestone(1)
        input 'Deploy to Production?'
        milestone(2)
      }
    }
    */



    /*
    stage('Production Deployment') {
      when {
        expression { env.BRANCH_NAME == 'master' }
      }
      environment {
        RELEASE_NAME = 'laravelhello-production'

      }
      steps {
        sh '''

          helm upgrade --install --namespace production $RELEASE_NAME ./helm/laravelhello --set image.tag=$BUILD_ID
        '''
      }
    }
    */


  }
  }
