pipeline{
  agent {
    label 'SLAVE'
  }

  environment{
    NEXUS= credentials('Nexus')
    MAJOR_VERSION = "1.0"
  }

  stages {
    stage('Create an archive file'){
      steps{
        sh '''
          tar -cvf mongodb-service-${MAJOR_VERSION}-${BUILD_NUMBER} catalogue.js user.js
'''
      }
    }
    stage('Upload to Nexus Repository'){
      steps{
        sh '''
     curl -f -v -u  $NEXUS --upload-file mongodb-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz https://nexus.devops46.online/repository/mongodb-service/mongodb-service-${MAJOR_VERSION}-${BUILD_NUMBER}.tgz
        '''
      }
    }
  }
}