pipeline{
    options{
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }

    agent any

    environment{
        AWS_ACCESS_KEY_ID = credentials('terraform-admin')
        AWS_SECRET_ACCESS_KEY_ID = credentials('terraform-admin')

        // for build versioning
        BUILD_VERSION = "1.0.0"
    }
    stages{
        // Pushing Docker Image to AWS ECR
        stage('building and pushing docker image to aws ecr'){
            steps{
                script{
                    withDockerRegistry([credentialsId:'ecr:ap-south-1:ecr-credential', url:'https://150387322390.dkr.ecr.ap-south-1.amazonaws.com']){
                        sh 'docker build -t flask-container .'
                        sh 'docker tag flask-container:latest 150387322390.dkr.ecr.ap-south-1.amazonaws.com/flask-container:$BUILD_VERSION'
                        sh 'docker push 150387322390.dkr.ecr.ap-south-1.amazonaws.com/flask-container:$BUILD_VERSION'
                    }
                }
            }
        }
    }
    
}