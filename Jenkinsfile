#steps 

#setup jenkins on local
#install docker plugins
#add dockerhub credentials 
#add kubeconfig file in credentials of jenkins
#download necessary plugins for kubenetes as I done in local I used minikube to make cluster and use for deployment 


pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials-id'
        DOCKER_IMAGE = "sagarjangid16/wisecow:latest"
        KUBECONFIG_CREDENTIALS_ID = 'kubeconfig-credentials-id'
        GIT_REPO_URL = 'https://github.com/SagarJangid16/wisecow.git'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: "${GIT_REPO_URL}", branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image using Dockerfile in the repo
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        sh 'docker push ${DOCKER_IMAGE}'
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    withKubeConfig(credentialsId: KUBECONFIG_CREDENTIALS_ID) {
                        sh 'kubectl apply -f deployment.yaml'
                        sh 'kubectl apply -f service.yaml'
                        sh 'kubectl apply -f ingress.yaml'
                    }
                }
            }
        }
    }
}
