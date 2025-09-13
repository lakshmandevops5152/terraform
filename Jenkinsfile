pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', https://github.com/lakshmandevops5152/terraform.git'
            }


        stage('Terraform Init') {
            steps {
                echo "Running terraform init..."
                sh 'terraform init -input=false'
            }
        }

        stage('Terraform Plan') {
            steps {
                echo "Running terraform plan..."
                sh 'terraform plan'
            }
        }

        stage('Approve Apply?') {
            steps {
                script {
                    def userApproval = input(
                        message: 'Apply Terraform changes?',
                        parameters: [
                            choice(name: 'Approve', choices: 'No\nYes', description: 'Select Yes to apply.')
                        ]
                    )
                    
                    if (userApproval == 'No') {
                        echo "User chose not to apply changes."
                        currentBuild.result = 'ABORTED'
                        error("Stopping pipeline — apply not approved.")
                    }
                }
            }
        }



