pipeline{
    agent any
    triggers{
        pollSCM('* * * * *')
    }
    stages{
        stage('git'){
            steps{
                git url: 'https://github.com/bobbyande165/spring-petclinic-nithin.git',
                    branch:'main'
            }
        }
        stage("build,scan and run"){
            steps{
                withCredentials([string(credentialsId: 'SONAR_ID', variable: 'SONAR_TOKEN')]){
                    withSonarQubeEnv('sonar'){
                        sh '''
                        mvn clean package \
                        org.sonarsource.scanner.maven:sonar-maven-plugin:sonar \
                        -Dsonar.projectKey=bobbyande165 \
                        -Dsonar.organization=bobbyande165 \
                        -Dsonar.host.url=https://sonarcloud.io \
                        -Dsonar.token=$SONAR_TOKEN '''
                    }
                }
            }
        
        }
    }
}