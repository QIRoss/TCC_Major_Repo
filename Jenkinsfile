pipeline {
    agent any

    environment {
        TZ = 'America/Sao_Paulo'
    }

    stages {
        stage('Print Time') {
            steps {
                script {
                    def currentTime = sh(script: 'TZ=America/Sao_Paulo date "+%H:%M:%S"', returnStdout: true).trim()
                    echo "Current Time in Brazil: ${currentTime}"
                }
            }
        }
        stage('Update Submodules') {
            steps {
                script {
                    sh 'git submodule update --init --recursive'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                checkout scm
                
                dir('TCC_Dummy_GPS_API') {
                    sh 'pwd'
                    sh 'ls -l'
                    sh 'docker build -t dummy_gps_image .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 2947:2947 --name dummy_gps_container dummy_gps_image'
            }
        }
        stage('Test Dummy GPS Service') {
            steps {
                sh 'curl localhost:2947'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
    }
}
