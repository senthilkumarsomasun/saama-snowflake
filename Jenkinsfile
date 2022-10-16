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
            sh '''pwd
liquibase --version'''
          }
        }

      }
    }

  }
  environment {
    nameofperson = 'Senthil Kumar Somasundaram'
  }
}