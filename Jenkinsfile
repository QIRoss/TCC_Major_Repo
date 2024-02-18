pipeline {
    agent any

    stages {
        stage('Echo Working') {
            steps {
                echo 'working'
            }
        }
        stage('Print Time') {
            steps {
                script {
                    def currentTime = sh(script: 'date "+%H:%M:%S"', returnStdout: true).trim()
                    echo "Current Time: ${currentTime}"
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
