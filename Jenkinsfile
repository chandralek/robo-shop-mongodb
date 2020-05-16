pipeline {

  agent {
    label 'SLAVE'
  }

  environment {
    NEXUS=credentials('Nexus')
    MAJOR_VERSION="1.0"
  }
  stages {


    stage('Create Archive to Upload') {
      steps {
        sh '''
          tar -czf mongodb-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz *.js
        '''
      }
    }

    stage('Upload To Nexus') {
      steps {
        sh '''
          curl -f -v -u $NEXUS --upload-file mongodb-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz https://nexus.devopsb46.online/repository/mongodb-service/mongodb-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz
        '''
      }
    }

  }
}