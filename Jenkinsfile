pipeline {
  agent any
  environment {
    SF_CRED=credentials('SNOWFLAKE_CRED')
    DBURL_CRED=credentials('JDBC_URL')
  }
  
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

          }
        }

      }
    }

  }

}
