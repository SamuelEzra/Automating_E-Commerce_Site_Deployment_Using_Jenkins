pipeline {
    agent any
    
    stages {
        stage('Connect to GitHub') {
            steps {
                echo 'Checkout code...'
                // Add your build steps here
                checkout scmGit(
                    branches: [[name: '*/main']],
                    extensions: [],
                    userRemoteConfigs: [[url: 'https://github.com/SamuelEzra/Automating_E-Commerce_Site_Deployment_Using_Jenkins.git']]
                )
            }
        }
        stage('Connect to DockerHub') {
            steps {
                echo 'Logging into DockerHub...'
                script {
                    withCredentials([
                        usernamePassword(
                            credentialsId: 'ecom-dockerhub-creds',
                            usernameVariable: 'DOCKERHUB_USER',
                            passwordVariable: 'DOCKERHUB_PASSWORD'
                        )
                    ]) {
                        sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USER --password-stdin'
                    }
                }
            }
        }
        stage('Build with Dockerfile') {
            steps {
                echo 'Building with Docker...'
                // Add your test steps here
                sh 'docker build -t ezraone/ecommerce .'
            }
        }
        stage('Run Container') {
            steps {
                echo 'Running Docker container...'
                // Add your deploy steps here
                sh 'docker run -d -p 8010:80 ezraone/ecommerce'
            }
        }
        stage('Push to DockerHub') {
            steps {
                echo 'Push to DockerHub...'
                sh 'docker push ezraone/ecommerce'
            }
        }
    }
}