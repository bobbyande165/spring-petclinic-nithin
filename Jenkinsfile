pipeline{
    agent{label 'JAVA'}
    triggers{
        pollSCM('* * * * *')
    }
    stages{
        stage('git'){
            steps{
                git url:'https://github.com/bobbyande165/spring-petclinic-nithin.git',
                    branch:'main'
            }
        }
        stage('build,scan and run'){
            steps{
                withCredentials([string(credentialsId:'sonar_id',variable:'SONAR_TOKEN')]){
                    withSonarQubEnv('SONAR'){
                        sh ''' mvn package sonar:sonar \
                        -Dsonar.projectKey=bobbyande165_spring-petclinic-nithin \
                        -Dsonar.organization=bobbyande165 \
                        -Dsonar.host.url=https://sonarcloud.io \
                        -Dsonar.login=$SONAR_TOKEN '''
                    }
                }
            }
        }
    }

}