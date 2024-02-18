pipeline {
    agent any

    stages {
        stage('Echo Working') {
            steps {
                echo 'working'
            }
        }
        stage('Print Hour') {
            steps {
                script {
                    def currentHour = sh(script: 'date +%H', returnStdout: true).trim()
                    echo "Current Hour: ${currentHour}"
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