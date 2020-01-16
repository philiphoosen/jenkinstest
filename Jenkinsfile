pipeline {
    triggers {
      pollSCM('* * * * *')
    }

    agent any

    stages {
        stage('Build') {
            steps {
                script {
                  // get changed projects from last commit
                  def changed_projects = sh(
                    script: "git diff-tree --no-commit-id --name-only -r \$(git log --format='%H' -n 1) | sed -En 's|^(.+)/.+|\\1|p' | uniq", 
                    returnStdout: true
                  ).split("\n")
                  
                  // trigger build for each changed project
                  for(project in changed_projects){
                      println project
                      if(project != ""){
                        build job: "${project}/${BRANCH_NAME}", wait: false
                      }
                  }
                }
            }
        }
    }
}