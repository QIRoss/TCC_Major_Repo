pipeline {
    agent any
    
    stages {
        stage('Check Workspace') {
            steps {
                script {
                    checkout scm
                    
                    dir('TCC_Dummy_GPS_API') {
                        sh 'pwd'
                        
                        sh 'ls -l'
                    }
                }
            }
        }
    }
}
