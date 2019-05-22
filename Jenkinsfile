pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
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
                sh 'docker run -d --rm -p 8888:8888 --name config-production config'
            }
        }
    }
}