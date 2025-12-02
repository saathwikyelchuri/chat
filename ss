https://github.com/budarajumadhurika/SampleMavenJavaProject.git'

https://github.com/budarajumadhurika/SampleMavenWebProject.git'

//java project
node {

    stage('Clone Repository') {
        git branch: 'main',
            url: 'https://github.com/budarajumadhurika/SampleMavenJavaProject.git'
    }

    stage('Build') {
        bat 'mvn clean package'
    }

    stage('Test') {
        bat 'mvn test'
    }

    stage('Archive') {
        archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
        junit 'target/surefire-reports/*.xml'
    }
}



// web project
node {

    stage('Clone Repository') {
        git branch: 'main',
            url: 'https://github.com/budarajumadhurika/SampleMavenWebProject.git'
    }

    stage('Build WAR') {
        bat 'mvn clean package'
    }

    stage('Run Tests') {
        bat 'mvn test'
    }

    stage('Archive WAR & Test Results') {

        // Archive WAR file
        archiveArtifacts artifacts: 'target/*.war', fingerprint: true

        // If test reports exist → archive them, otherwise skip
        if (fileExists('target/surefire-reports')) {
            junit 'target/surefire-reports/*.xml'
        } else {
            echo "No test reports found — skipping junit archiving."
        }
    }

    stage('Summary') {
        echo "Build completed successfully!"
    }
}
