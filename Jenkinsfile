pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        git(url: 'https://github.com/senthilkumarsomasun/saama-snowflake', branch: 'main')
      }
    }

    stage('log') {
      parallel {
        stage('log') {
          steps {
            sh 'ls -ltra'
          }
        }

        stage('liqubaseVersion') {
          steps {
            sh '''pipeline {
  agent {
    docker { image \'liquibase/liquibase:4.4.2\' }
  }
  stages {
    stage(\'Test\') {
      steps {
        sh \'liquibase --version\'
      }
    }
  }
}'''
            }
          }

        }
      }

    }
    environment {
      nameofperson = 'Senthil Kumar Somasundaram'
    }
  }