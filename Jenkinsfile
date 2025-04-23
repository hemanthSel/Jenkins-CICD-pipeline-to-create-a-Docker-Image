CI Pipeline Script:
###############
node {
    stage('git checkout'){
        cleanWs()
        echo 'git checkout start'
        git 'https://github.com/hemanthSel/Jenkins-Docker-Project.git'
        echo 'git checkout end'
    }
   
    stage('Docker login'){
        script{
            withCredentials([usernamePassword(credentialsId: 'DOCKER_CREDENTIALS_PWD', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Execute Docker login command
                        sh """
                        docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
                        sudo chmod 777 /var/run/docker.sock
                        sudo docker image prune -af
                        sudo docker build -f /var/lib/jenkins/workspace/dockerimg/Dockerfile -t hemanth509/$JOB_NAME:v1.$BUILD_ID .
                        sudo docker image tag  hemanth509/$JOB_NAME:v1.$BUILD_ID hemanth509/$JOB_NAME:latest
                        sudo docker run -d -p 500:80 -v /var/www/html:/usr/local/apache2/htdocs/ hemanth509/$JOB_NAME:v1.$BUILD_ID
                        """
                        echo "logged into docker with user:${DOCKER_USERNAME}"
                    }
        }
    }
    stage('push images to dockerhub'){
        echo 'Push docker image to dockerhub started'
      withCredentials([usernamePassword(credentialsId: 'DOCKER_CREDENTIALS_PWD', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
       sh """          
        sudo docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
        sudo docker image push hemanth509/$JOB_NAME:v1.$BUILD_ID
        sudo docker image push hemanth509/$JOB_NAME:latest
      """
        }
        echo 'Docker images pushed to docker hub'
    }
    stage('delete local images'){
         echo 'Delete docker images'
        sh 'docker image rm $JOB_NAME:v1.$BUILD_ID hemanth509/$JOB_NAME:v1.$BUILD_ID hemanth509/$JOB_NAME:latest'
        echo 'Delete docker images complete'
    }
    
        stage('pull image from Docker Hub and run'){
        sshagent(['ssh_webapp-_server']) {
       sh "ssh -o StrictHostKeyChecking=no ubuntu@18.233.9.13" // ${docker_run}" 
       sh 'docker pull hemanth509/docker-groovy:latest'
       sh 'sudo docker run -d -p 1000:80 hemanth509/docker-groovy:latest'
       sh 'docker ps -a'
     }
    }
 }






CD Pipeline Scripts:
#####################

#!/bin/bash
sudo chmod 777 /var/run/docker.sock
sudo docker pull hemanth509/dockerimg:latest
sudo docker run -d -p 1000:80 hemanth509/dockerimg:latest
docker ps -a
