pipeline{
    agent any
// we need to give where docker is installed on our system so that we do not need to give /usr/local/docker path evertime, you can directly use docker
//
// i.e.path to docker in binary file
    environment{
        PATH = "$PATH:/usr/local/bin"
        DOCKERHUB_ACCESS_TOKEN = credentials('DOCKERHUB_ACCESS_TOKEN')
        GIT_REPO= "https://github.com/Manjiri-here/Jenkins.git"
        IMAGE_NAME= "manjirinaik/myapp"
        DOCKER_USERNAME= "manjirinaik"
    }
    stages{
        stage('git-repo'){
            steps{
                git branch: 'main', changelog: false, poll: false, url: "${GIT_REPO}"
            }
        }
        stage('building code'){
            steps{
                 echo "building the code"
            }
    }
        stage('testing code'){
            steps{
                echo "test the application code"
            }
        }
        stage('build docker image'){
            steps{
                sh "docker image build -t ${IMAGE_NAME} ."
            }
        }
        // login to docker hub
        stage('docker hub login'){
            steps{
                sh "echo ${DOCKERHUB_ACCESS_TOKEN} | docker login -u ${DOCKER_USERNAME} --password-stdin"
            }
        }
        stage('push the image to docker hub'){
            steps{
                sh "docker image push $IMAGE_NAME"
            }
        }
        //create the service
        //stage('create docker service'){
          //  steps{
            //    sh "docker service create --name myapp -p 8090:80 $IMAGE_NAME"
            //}
        //}
        stage("update docker service"){
            steps{
                sh "docker service update --force --image $IMAGE_NAME myapp"
            }
        }
}
}
