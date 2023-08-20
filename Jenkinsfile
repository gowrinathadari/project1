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
}
