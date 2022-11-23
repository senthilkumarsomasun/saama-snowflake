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
export PATH=$PATH:/etc/liqubase
'''
            sh '/etc/liqubase/liquibase --version'
            sh 'echo ${JDBC_URL}'
            sh 'echo ${SNOWFLAKE_CRED_USR} ; echo ${SNOWFLAKE_CRED_PSW}'
          }
        }

        stage('OMLIQUBASEOM') {
          steps {
            sh '/etc/liqubase/liquibase update --url=\'jdbc:snowflake://$SF_URL_USR?warehouse=DEMO_WH&db=DEV_CUST_DB&schema=CUSTOMER&role=PUBLIC\' --changeLogFile=my_app-wrapper.xml --username=$SF_CRED_USR --password=$SF_CRED_PSW --log-level flag'
          }
        }

      }
    }

    stage('Send Email Notifications') {
      steps {
        emailext(subject: 'CI/CD - Automation - DEV Build ', body: 'CI/CD - Automation - DEV Build ', replyTo: 'senitbox@gmail.com', attachLog: true, saveOutput: true, to: 'senthilkumarsomasun@gmail.com')
      }
    }

  }
  environment {
    SF_CRED = credentials('SNOWFLAKE_CRED')
    SF_URL = credentials('JDBC_URL')
  }
}
