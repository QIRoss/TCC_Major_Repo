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
                script {
                    def hostIpAddress = sh(script: "ip route | awk '/default/ { print \$3 }'", returnStdout: true).trim()
                    sh "curl ${hostIpAddress}:2947"
                }
            }
        }
    }

    post {
        always {
            sh 'docker stop dummy_gps_container'
            sh 'docker rm dummy_gps_container'
            echo 'Pipeline execution completed.'
        }
    }
}
