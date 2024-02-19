pipeline {
    agent any

    environment {
        TZ = 'America/Sao_Paulo'
    }

    stages {
        stage('Timestamp') {
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
                    checkout scm
                }
            }
        }
        stage('Build Dummy GPS API Image') {
            steps {
                dir('TCC_Dummy_GPS_API') {
                    sh 'pwd'
                    sh 'ls -l'
                    sh 'docker build -t tcc-tcc_dummy_gps_api .'
                }
            }
        }
        stage('Run Dummy GPS API Container') {
            steps {
                sh 'docker run -d --network jenkins_network --name dummy_gps_container tcc-tcc_dummy_gps_api'
            }
        }
        stage('Wait for Dummy GPS API Service Startup') {
            steps {
                echo 'Waiting for service to start...'
                sleep time: 5, unit: 'SECONDS'
            }
        }
        stage('Test Dummy GPS Service') {
            steps {
                sh "curl dummy_gps_container:2947"
            }
        }
        stage('Build Voice Processing Image') {
            steps {
                dir('TCC_Voice_Processing') {
                    sh 'pwd'
                    sh 'ls -l'
                    sh 'docker build -t tcc-tcc_voice_processing .'
                }
            }
        }
        stage('Run Voice Processing Container') {
            steps {
                sh 'docker run -d --network jenkins_network --name voice_processing_container tcc-tcc_voice_processing'
            }
        }
        stage('Wait for Voice Processing Service Startup') {
            steps {
                echo 'Waiting for service to start...'
                sleep time: 5, unit: 'SECONDS'
            }
        }
        stage('Test Voice Processing Service') {
            steps {
                script {
                    def curlOutput = sh(script: 'curl -X POST -F "file=@/var/jenkins_home/workspace/TCC CI Pipeline/TCC_Voice_Processing/audios/smoke_inhalation_respiratory_distress.wav" voice_processing_container:5000/transcribe', returnStdout: true).trim()
                    sh 'echo "Curl Output: ${curlOutput}"'
                    def regexPattern = /respiratory|smoke|inhalation/
                    
                    def matchFound = (curlOutput =~ regexPattern).find()
                    
                    if (matchFound) {
                        println "Match found: true"
                    } else {
                        println "Match found: false"
                    }
                }
            }
        }
    }

    post {
        always {
            sh 'docker stop dummy_gps_container'
            sh 'docker rm dummy_gps_container'
            sh 'docker stop voice_processing_container'
            sh 'docker rm voice_processing_container'
            echo 'Pipeline execution completed.'
        }
    }
}
