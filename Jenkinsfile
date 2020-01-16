pipeline {
    triggers {
      pollSCM('* * * * *')
    }

    agent any

    stages {
        stage('Build') {
            steps {
                script {
                  def changed_projects = sh(
                    script: "git diff-tree --no-commit-id --name-only -r \$(git log --format='%H' -n 1) | sed -En 's|^(.+)/.+|\\1|p' | uniq", 
                    returnStdout: true
                  )
                  
                  println changed_projects
                  def projects = changed_projects.split("\n");

                  for(project in projects){
                      println project
                      build job: "${project}/${BRANCH_NAME}", wait: false
                  }
                }
            }
        }
    }
}