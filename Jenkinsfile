pipeline{
    /* Allocate an executor in any available jenkins agent/node within 
    * the jenkins workspace / environment for the entire pipeline.
    */
    agent any
    stages{
        // Stage 1 - Check out from SCM
        stage("Stage 1 - Check out from SCM"){
            steps{
                echo "========Stage 1 - Check out from SCM========"
            }
        }

        // Stage 2 - Build, Test then package.
        stage("Stage 2 - Build, Test then package"){
            steps{
                echo "========Stage 2 - Build, Test then package========"
            }
        }

        // Stage 3 - Create a docker container.
        stage("Stage 3 - Create a docker container"){
            steps{
                echo "========Stage 3 - Create a docker container========"
            }
        }
    }
}