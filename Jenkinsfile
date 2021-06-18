pipeline {
    agent any 
    stages {
        stage('Building the image') {
            steps {
                sh 'echo Docker is building the image' 
                //here i can add the docker build instruction to build the newer images
            }
        }
        stage('Updating the webpage') {
            steps {
                sh "sed -i 's/${old_title}/${new_title}/g' index.html"
                sh "sed -i '/BUILD ID=/ c \"BUILD ID= ${BUILD_ID}\"' index.html"
                sh "sed -i '/BUILD URL=/ c \"BUILD URL= ${BUILD_URL}\"' index.html"
                sh "sed -i '/JOB_NAME=/ c \"JOB_NAME= ${JOB_NAME}\"' index.html" 
                sh "sed -i '/WORKSPACE=/ c \"WORKSPACE= ${WORKSPACE}\"' index.html"
            }
        }
        stage('Deploying') {
            steps {
                sh '/usr/local/bin/docker-compose up -d'
            }
        }
    }
    post {
        success {
            slackSend (color: '#00ff00', message: "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
        failure {
            slackSend (color: '#ff0000', message: "Failure: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
    }
}
