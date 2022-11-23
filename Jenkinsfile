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
            sh '''echo ${SF_URL_USR}
echo ${SF_CRED_USR}
echo ${SF_CRED_PSW}'''
            sh 'echo ${SNOWFLAKE_CRED_USR} ; echo ${SNOWFLAKE_CRED_PSW}'
          }
        }

        stage('Snowflake-Call-Updates-DDL') {
          steps {
            sh '''export url_link=${SF_URL_USR}
export sfdb=DEV_CUST_DB
export sch=CUSTOMER
export ops_role=PUBLIC
export whs=DEMO_WH
echo ${url_link}
echo ${sfdb}
echo ${sch}
echo ${ops_role}
echo ${whs}
export sf_url=jdbc:snowflake://${url_link}?warehouse=${whs}&db=${sfdb}&schema=${sch}&role=${ops_role}
echo ${sf_url}
#/etc/liqubase/liquibase update --url=${sf_url} --changeLogFile=my_app-wrapper.xml --username=${SF_CRED_USR} --password=${SF_CRED_PSW}'''
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