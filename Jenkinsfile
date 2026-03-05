pipeline{
    agent{label JAVA}
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
                withCredentials([string(credentialsID: 'SONAR', variable: 'SONAR_TOKEN')]){
                    withSonarQubeEnv('sonar_id'){
                        sh """mvn package sonar:sonar \
                        -Dsonar.projectKey=bobbyande165_spring-petclinic-own \
                        -Dsonar.organization=bobbyande165 \
                        -Dsonar.host.url=https://sonarcloud.io \
                        -Dsonar.login=$SONAR_TOKEN"""
                    }
                }
            }
        
        }

    }
}