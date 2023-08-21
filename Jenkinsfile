@Library("my-shared-library") _
pipeline {
    agent any
    
    tools {
        maven 'MAVEN'
    }
    stages {
        stage('Git checkout'){
            steps {
                gitcheckout()
            }
        }
        stage('Unit Test') {
            steps {
                mvnTest()
            }
        }
        stage('Integration Test') {
            steps {
                mvnint()
            }
        }
        stage('Maven Build') {
            steps {
                script {
                    sh 'mvn clean install'
                }
                
            }
        }
    }
    post {
        alwasys {
            mail bcc: '', body: """project:${env.JOB_NAME} Build Number:${env.BUILD_NUMBER} url:${env.BUILD_URL} """, cc: '', from: '', replyTo: '', subject: 'Jenkins Build Status', to: 'gowrinath225@gmail.com'
        }
    }
}
