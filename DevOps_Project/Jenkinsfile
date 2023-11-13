
def getGitBranchName() {
  return scm.branches[0].name
}

def branchName
def targetBranch

pipeline {
    agent any

    environment {
       DOCKERHUB_USERNAME = "souhaibsfaxi"
       DEV_TAG = "${DOCKERHUB_USERNAME}/devops-sou-backend:v1.0.0-dev"
       STAGING_TAG = "${DOCKERHUB_USERNAME}/devops-sou-backend:v1.0.0-staging"
       PROD_TAG = "${DOCKERHUB_USERNAME}/devops-sou-backend:v1.0.0-prod"
    }

    stages {
        

        stage('branch name') {
      steps {
        script {
          branchName = params.BRANCH_NAME
          echo "Current branch name: ${branchName}"
        }
      }
    }

    stage('target branch') {
      steps {
        script {
          targetBranch = branchName
          echo "Target branch name: ${targetBranch}"
        }
      }
    }


    stage('Github') {
            steps {
            
              git branch : branchName , url: 'https://github.com/souhaibsfaxi/Devops_project_ABM_souhaib_s.git' , credentialsId:'Github_creds'
                
               echo "Current branch name: ${branchName}"
               echo "Target branch name: ${targetBranch}"
                
            }
        }

        stage('Build') {
            steps {
                script {
                
                    sh "mvn clean package"  
                    
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool name: 'SonarQubeScanner'
                    withSonarQubeEnv('sonarqube') {
                        sh "${scannerHome}/bin/sonar-scanner"
                    }
                }
            }
        }


        // stage('Unit Tests') {
        //     steps {
        //         script {
        //             // Add your testing commands here
        //             sh "mvn test"  // For Maven
        //             // Or
        //             // sh "./gradlew test"  // For Gradle
        //         }
        //     }
        // }

        

        // stage('Docker Build') {
        //     steps {
        //         script {
        //             def dockerImage = "your-docker-image-name:latest"
        //             def dockerFile = "Dockerfile"  // Adjust if your Dockerfile has a different name

        //             // Build a Docker image
        //             sh "docker build -t $dockerImage -f $dockerFile ."

        //             // Push the Docker image to a container registry
        //             sh "docker push $dockerImage"
        //         }
        //     }
        // }

    //     stage('Deploy') {
    //         when {
    //             expression {
    //                 currentBuild.resultIsBetterOrEqualTo('SUCCESS')
    //             }
    //         }
    //         steps {
    //             script {
    //                 // Deploy your Docker image to your production environment here
    //                 // For example, use Docker Compose or Kubernetes YAML files
    //             }
    //         }
    //     }
    // }

    // post {
    //     success {
    //         echo 'Deployment successful.'
    //     }
    //     failure {
    //         echo 'Deployment failed.'
    //     }
    // }
}
