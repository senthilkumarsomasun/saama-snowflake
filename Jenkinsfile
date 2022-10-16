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
export PATH=$PATH:/etc/liqubase;
export CLASSPATH=/etc/liqubase/lib/snowflake-jdbc-3.9.2.jar'''
            sh '/etc/liqubase/liquibase --version'
            sh 'echo ${SF_CRED_USR}'
            sh 'echo ${SF_URL_CRED_USR} ; echo ${SF_URL_CRED_PSW}'
          }
        }

        stage('error') {
          steps {
            sh '/etc/liqubase/liquibase update --url="jdbc:snowflake:saama.snowflakecomputing.com/?warehouse=DEMO_WH&db=DEV_CUST_DB&schema=CUSTOMER" --changeLogFile=my_app-wrapper.xml --username=$SF_CRED_USR --password=$SF_CRED_PSW'
          }
        }

      }
    }

  }
  environment {
    SF_CRED = credentials('SNOWFLAKE_CRED')
  }
}