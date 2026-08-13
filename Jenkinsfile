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
        stage("artifact upload"){
            steps{
                nexusArtifactUploader artifacts: [[artifactId: 'spring-petclinic', classifier: '', file: 'target/spring-petclinic-4.0.0-SNAPSHOT.jar', type: 'jar']], credentialsId: 'nexus', groupId: 'org.springframework.boot', nexusUrl: 'http://15.207.115.126:8081/', nexusVersion: 'nexus3', protocol: 'http', repository: 'spc-repo', version: '4.0.0-SNAPSHOT'
            }
        }
    }
    post{
        always{
            archiveArtifacts artifacts: '**/*.jar', fingerprint:true
            junit '**/surefire-reports/*.xml'
        }
    }
}