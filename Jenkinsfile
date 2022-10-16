pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        git(url: 'https://github.com/senthilkumarsomasun/saama-snowflake', branch: 'main')
      }
    }

    stage('log') {
      environment {
        DB_CRED = 'credentials(\'SNOWFLAKE_CRED\')'
      }
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
            sh '''echo $DB_CRED_USR
echo $DB_CRED_PSW'''
          }
        }

      }
    }

  }
  environment {
    nameofperson = 'Senthil Kumar Somasundaram'
  }
}