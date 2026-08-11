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
        stage('Sonarqube Analysis'){
            environment{
                SONAR_HOST_URL= 'https://sonarcloud.io/'
                SONAR_AUTH_TOKEN= credentials('SONAR_ID')
            }
            steps{
                sh 'mvn package mvn package org.sonarsource.scanner.maven:sonar-maven-plugin:5.6.0.6792:sonar -Dsonar.projectKey=bobbyande165 -Dsonar.organization=bobbyande165 -Dsonar.host.url=$SONAR_HOST_URL -Dsonar.token=$SONAR_AUTH_TOKEN' 
            }
        }
    }
}