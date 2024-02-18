pipeline {
    agent any

    stages {
        stage('Echo Working') {
            steps {
                echo 'working'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
    }
}