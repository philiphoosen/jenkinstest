pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                  def changed_projects = sh(
                    script: "/bin/bash -c 'git diff-tree --no-commit-id --name-only -r $(git log --format=\"%H\" -n 1) | sed -En \'s|^(.+)/.+|\1|p\' | uniq'", 
                    returnStdout: true
                  )

                  println changed_projects
                }
            }
        }
    }
}