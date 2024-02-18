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
                    script {
                        dockerapp = docker.build("tcc-dummy-gps-api:latest")
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
