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
                // Save plan to a file and show it in console
                sh 'terraform plan 
                sh 'terraform show 
            }
        }

        stage('Approval') {
            steps {
                script {
                    // Jenkins pauses here for manual approval in UI
                    timeout(time: 10, unit: 'MINUTES') {
                        def userInput = input(
                            id: 'Proceed1',
                            message: 'Terraform plan is ready. Do you want to APPLY these changes?',
                            parameters: [
                                choice(name: 'CONFIRM', choices: ['No', 'Yes'], description: 'Select Yes to apply changes')
                            ]
                        )
                        if (userInput != 'Yes') {
                            error("User declined apply. Pipeline stopped.")
                        }
                    }
                }
            }
        }

        stage('Apply') {
            steps {
                // Apply exactly the saved plan
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
