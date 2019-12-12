pipeline{
    /* Allocate an executor in any available jenkins agent/node within 
    * the jenkins workspace / environment for the entire pipeline.
    */
    agent any
    stages{       
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
        // Stage 2 - Create a docker container.
        stage("Stage 2 - Create a docker container"){
            steps{
                echo "========Stage 2 - Create a docker container========"
            }
        }
    }
}