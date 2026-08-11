pipeline{
    agent any
    tools{
        maven 'maven'
    }
    stages{
        stage('git checkout'){
            steps{
                git url: 'https://github.com/bobbyande165/spring-petclinic-nithin.git',
                    branch:'main'
            }
        }
        stage('Build'){
            steps{
                sh 'mvn compile'
            }
        }
        stage('Test'){
            steps{
                sh 'mvn test'
            }
        }
        stage("build,scan and run"){
            steps{
                withCredentials([string(credentialsId: 'SONAR_ID', variable: 'SONAR_TOKEN')]){
                    withSonarQubeEnv('SonarQube'){
                        sh '''mvn clean package org.sonarsource.scanner.maven:sonar-maven-plugin:5.6.0.6792:sonar \
                        -Dsonar.projectKey=bobbyande165 \
                        -Dsonar.organization=bobbyande165 \
                        -Dsonar.host.url=https://sonarcloud.io \
                        -Dsonar.login=$SONAR_TOKEN '''
                    }
                }
            }
        
        }
    }
}