pipeline {
    agent any

    environment {
        TZ = 'America/Sao_Paulo'
    }

    stages {
        stage('Echo Working') {
            steps {
                echo 'working . . .'
            }
        }
        stage('Print Time') {
            steps {
                script {
                    def currentTime = sh(script: 'TZ=America/Sao_Paulo date "+%H:%M:%S"', returnStdout: true).trim()
                    echo "Current Time in Brazil: ${currentTime}"
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                checkout scm
                
                dir('TCC_Dummy_GPS_API') {
                    script {
                        sh 'docker build -t my-docker-image .'
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
    }
}
