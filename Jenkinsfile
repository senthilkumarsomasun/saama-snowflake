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
            sh '''echo $PATH
export PATH=$PATH:/etc/liqubase'''
            sh '/etc/liqubase/liquibase --version'
            sh 'echo ${SF_CRED_USR}'
          }
        }

      }
    }

  }
  environment {
    SF_CRED = credentials('SNOWFLAKE_CRED')
  }
}