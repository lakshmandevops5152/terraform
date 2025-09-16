pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/lakshmandevops5152/terraform.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Show full plan in console with colors
                sh 'terraform plan -no-color -out=tfplan'
                sh 'terraform show -color tfplan'
            }
        }

        stage('Approval') {
            steps {
                script {
                    // Ask for manual approval
                    input message: "Do you want to apply these changes?", ok: "Yes, Apply"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                // Apply only after approval
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
