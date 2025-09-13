pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/lakshmandevops5152/terraform.git'
            }
        }

        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Plan') {
            steps {
                // Show full plan in console
                sh 'terraform plan -no-color'
            }
        }

        stage('Approve Apply') {
            steps {
                script {
                    // Ask for manual confirmation in Jenkins UI before applying
                    def userInput = input(
                        id: 'Proceed1', 
                        message: 'Do you want to apply these changes?', 
                        parameters: [
                            choice(name: 'CONFIRM', choices: 'No\nYes', description: 'Select Yes to apply changes')
                        ]
                    )
                    if (userInput == 'Yes') {
                        sh 'terraform apply -auto-approve'
                    } else {
                        echo "Apply stage skipped by user."
                    }
                }
            }
        }
    }
}
