def notifySuccess() {   
            emailext body: "GOOD, The Jenkins pipeline was successful.\n You can view the build at: ${BUILD_URL}",
                subject: "Jenkins Job - Success",
                to: 'souhaib.sfaxi@esprit.tn'
}
def notifyFailure() {
            emailext body: "OUUUPS, The Jenkins job pipeline failed.\n You can view the build at: ${BUILD_URL}",
                subject: "Jenkins Job - Failure",
                to: 'souhaib.sfaxi@esprit.tn'
        }


pipeline {
  agent any

  stages {
    stage('Checkout GIT') {
      steps {
        git branch: 'main',
          credentialsId: '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',
          url :'https://github.com/souhaibsfaxi/Devops_project_ABM_souhaib_s.git'
      }
     
    }
    stage('Clean Build'){
            steps{
                sh 'mvn clean'
            }
        }
    stage('Compile'){
            steps{
                sh 'mvn compile'
            }
        }

    stage('Mockito Tests') {
     steps {
      sh 'mvn test'
        }
        }
    stage('Quality test SONARQUBE') {
      steps {
        sh 'mvn sonar:sonar -Dsonar.login=admin -Dsonar.password=Couragesou1.'
      }
    }
   
     stage('Deploy artifact with Nexus') {
       steps {
         sh 'mvn deploy -DskipTests'
       }
     }
    
     stage('Docker build'){
      steps{
       sh 'docker build -t souhaibsfaxi/souhaibdevopsb:spring --network host .'
      }
     }

    // stage('Docker push image'){
    //  steps{
    //   sh 'docker login -u samarcherni -p Handsoff2021'
    //   sh 'docker push samarcherni/samardevopsb:spring'
    //  }
    // }
    // stage('Docker-Compose Deploying'){
    //   steps{

    //     sh 'docker compose up -d --remove-orphans'
    //   }
    // }
    //   stage('Prometheus Grafana'){
    //   steps{

    //     echo 'doneeeee'
    //   }
    // }        
    // stage('Email Notification') {
    //         steps {
    //             script {
    //                 currentBuild.resultIsBetterOrEqualTo('SUCCESS') ? notifySuccess() : notifyFailure()
    //             }
    //         }
    //     }
}
}
