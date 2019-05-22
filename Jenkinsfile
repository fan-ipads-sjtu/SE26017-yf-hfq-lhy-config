pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh './mvnw clean package'
            }
        }
        stage('Test') {
            steps {
                sh './mvnw test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker stop config-production || true'
                sh 'docker build -t config .'
                sh 'docker run -d --rm --network host -p 8888:8888 --name config-production config'
            }
        }
    }
}