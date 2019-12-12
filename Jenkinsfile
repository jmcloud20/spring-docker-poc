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
                echo "========Stage 1 - Build, Test then package========"
                // For windows machine.
                bat 'mvn clean package'
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
                // bat docker build . -t jmgarcia214/sample-maven-app:${env.BUILD_NUMBER}
                // For linux machine
                sh docker build . -t jmgarcia214/sample-maven-app:${env.BUILD_NUMBER}
            }
        }

        // Stage  - Description
        // stage("Stage  - Description"){
        //     steps{
        //         echo "========Stage - Description========"
        //     }
        // }
        
    }
}