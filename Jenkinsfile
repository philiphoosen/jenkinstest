pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                  def commit_hash = sh(script: 'git log --format="%H" -n 1', returnStdout: true)
                  println commit_hash

                  // sh(script: "git diff-tree --no-commit-id --name-only -r ${commit_hash} > out.txt")
                  // def sed_command =  "sed -En 's|^(.+)/.+|\\1|p'"
                  // println sed_command

                  def changed_projects = sh(
                    script: "/bin/bash -c 'git diff-tree --no-commit-id --name-only -r ${commit_hash} | sed -En \'s|^(.+)/.+|\\1|p\' | uniq'", 
                    returnStdout: true
                  )

                  println changed_projects
                }
            }
        }
    }
}