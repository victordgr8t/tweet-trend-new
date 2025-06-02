pipeline {
    agent {
        node {
            label 'maven'
        }
    }

environment {
    PATH = "/opt/apache-maven-3.9.9/bin:$PATH"
}
    stages {
        stage ("build") {
            steps {
                echo "----------build started----------"
                sh 'mvn clean package -Dmaven.test.skip=true'
                echo "----------build completed----------"
            }
        }

        stage ("test") {
            steps {
                echo "----------unit test started----------"
                sh 'mvn surefire-report:report'
                echo "----------unit test completed----------"
            }
        }

        stage('SonarQube analysis') {
        environment {
            scannerHome = tool 'sonar-scanner' // must match the name of an actual scanner installation directory on your Jenkins build agent
        }
        steps {
        withSonarQubeEnv('sonar-server') { // If you have configured more than one global server connection, you can specify its name as configured in Jenkins
            sh "${scannerHome}/bin/sonar-scanner"
        }
        }
    }
}
}
