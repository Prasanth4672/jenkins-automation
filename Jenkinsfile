pipeline{
    agent any
    tools{
        maven 'maven'
    }
    #Setting Docker Path For MacOS
    environment {
        PATH = "/usr/local/bin:${env.PATH}"
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Prasanth4672/jenkins-automation']])
                sh 'mvn clean install'
            }
        }
        stage('Build Docker Image'){
            steps{
                sh 'docker build -t prakey/devops-integration .'
            }
        }
        stage('Push Image To Docker Hub'){
            steps{

                withCredentials([string(credentialsId: 'pwd', variable: 'dhubp')]) {
                        sh 'docker login -u prakey -p ${dhubp}'
                        sh 'docker push prakey/devops-integration'
                    }

            }
        }
    }
}