pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                def commit_hash = sh(script: 'git log --format="%H" -n 1', returnStdout: true)
                println commit_hash

                def changed_files = sh(
                  script: 'git diff-tree --no-commit-id --name-only -r ${commit_hash}', 
                  returnStdout: true
                )

                println changed_files
            }
        }
    }
}