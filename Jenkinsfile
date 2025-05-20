pipeline {
    agent any
    tools {
        maven 'maven'
    }
    
    stages {
        stage("clean") {
            steps {
                sh 'mvn clean'
            }
        }
        stage("validate") {
            steps {
                sh 'mvn validate'
            }
        }
        stage("test") {
            steps {
                sh 'mvn test'
            }
        }
        stage("package") {
            steps {
                sh 'mvn package'
            }
            post {
                success {
                    echo "build successfull"
                }
            }
        }
        stage("build docker images") {
            steps {
                sh 'docker build -t phonepe .'
            }
            post {
                success{
                    echo "image build successfully"
                }
                failure{
                    echo "image not built"
                }
            }
        }
        stage("push to docker hub"){
            steps{
                script {
                    sh"""
                    docker tag phonepe prakru07/phonepe
                    docker push prakru07/phonepe
                    """
                }
                post {
                success{
                    echo "image pushed successfully"
                }
                failure{
                    echo "image not pushed"
                }
            }
            }
                
        }
        stage("remove docker image locally"){
            steps{
                sh"""
                docker rmi -f prakru07/phonepe
                docker rmi -f phonepe
                """
            }
            post {
                success{
                    echo "removed local image successfully"
                }
                failure{
                    echo "image not removed locally"
                }
            }
        }
        stage("stop and restart"){
            steps {
                sh"""
                docker rm -f app
                docker run -it -d --name app -p 8081:8080 prakru07/phonepe
                """
            }
            post {
                success{
                    echo "image build successfully"
                }
                failure{
                    echo "image not built"
                }
            }
        }
    }
    post {
        success {
            echo "deployemnt successfull"
        }
        failure {
            echo "deployment is failure"
        }
    }
}