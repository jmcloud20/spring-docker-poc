pipeline{
    /* Allocate an executor in any available jenkins agent/node within 
    * the jenkins workspace / environment for the entire pipeline.
    */
    agent any
    stages{       
        // Template for new stage  - Description
        // stage("Stage  - Description"){
        //     steps{
        //         echo "========Stage - Description========"
        //     }
        // }

        // Stage 1 - Build, Test then package.
        stage("Stage 1 - Build, Test then package"){
            steps{
                echo "========Stage 1 - Test then package========"
                // For windows machine.
                sh 'mvn package'
                // For linux machine
                // sh 'mvn clean package'
            }
            post{
                success{
                    echo "========Success Stage 1 - Archiving successful build========"
                    archiveArtifacts artifacts : '**/*.war'
                }
                failure{
                    echo "========Failed Stage 1 - Build, Test then package========"
                }
            }
        }
        // Stage 2 - Create / Update a docker image.
        stage("Stage 2 - Create / Update a docker image"){
            steps{
                echo "========Stage 2 - Create / Update a docker image========"
                // For windows machine.
                
                echo "-- Create a build and tag image according to jenkins BUILD_NUMBER"
                sh "docker build . -t jmgarcia214/sample-maven-app:${env.BUILD_NUMBER}"
                
                echo "-- Update latest image version" 
                sh "docker tag jmgarcia214/sample-maven-app:latest jmgarcia214/sample-maven-app:${env.BUILD_NUMBER}"
                
                echo "-- Push both version and latest image."
                sh "docker push jmgarcia214/sample-maven-app:${env.BUILD_NUMBER}"
                sh "docker push jmgarcia214/sample-maven-app:latest"
                // For linux machine
                // sh docker build . -t jmgarcia214/sample-maven-app:${env.BUILD_NUMBER}
            }
        }

        // Stage 3  - Deploy Image
        stage("Stage 3  - Deploy image to current workspace."){
            steps{
                echo "========Stage - Deploy Image========"

                echo "-- make sure container sample-maven-app is not running."
                sh "docker stop sample-maven-app"

                echo "-- make sure image sample-maven-app does not exist."
                sh "docker rmi jmgarcia214/sample-maven-app:latest"
                
                echo "-- Run image on current machine."
                sh "docker run -p 8080:8080 -v d:/tmp/sample-maven-app:/usr/src/sample-maven-app/conf -v c:/Users/81255820/.m2:/root/.m2 --name sample-maven-app --rm jmgarcia214/sample-maven-app:latest"
            }
        }        
    }
}