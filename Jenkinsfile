pipeline {
  agent any
  tools {
    maven 'maven 3.5.0'
    jdk 'Java8'
  }

  stages {
    stage('Build Aplication') {
      steps {
        sh 'mvn -f otus-domain-root/pom.xml clean install'
      }
      post {
        always {
          junit '**/target/surefire-reports/*.xml'
          archive '**/target/surefire-reports/*.xml'
        }
      }
    }

    stage('Publish artifact') {
      steps {
        sh 'mvn -f otus-domain-root/pom.xml deploy'
      }
    }

    stage('Sonar Update') {
      steps {
        sh 'mvn -f otus-domain-root/pom.xml sonar:sonar -Dsonar.host.url=${URL_SONAR} -Dsonar.password=${PWD_SONAR} -Dsonar.login=${USER_SONAR}'
      }
    }

    stage('Build - Development Server') {
      steps {
        echo "DEPLOY"
        // sh 'mvn -f otus-domain-root/pom.xml clean install -Ddatabase.host=${DATABASE_DEV_HOST} -Ddatabase.username=${DATABASE_USER} -Ddatabase.password=${DATABASE_PWD}'
      }
    }

    }

  }
