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
                sh 'mvn sonar:sonar -Dsonar.projectkey=bobbyande165 -Dsonar.host.url=$SONAR_HOST_URL -Dsonar.token=$SONAR_AUTH_TOKEN' 
            }
        }
    }
}