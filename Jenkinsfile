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
            sh 'echo ${SF_URL_CRED_USR} ; echo ${SF_URL_CRED_PSW}'
          }
        }

      }
    }

  }
  environment {
    SF_CRED = credentials('SNOWFLAKE_CRED')
    SF_URL_CRED = credentials('JDBC_URL')
  }
}