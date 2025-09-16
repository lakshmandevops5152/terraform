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
                ansiColor('xterm') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                ansiColor('xterm') {
                    // Save plan and show it in console with colors
                    sh 'terraform plan -out=tfplan'
                    sh 'terraform show tfplan'
                }
            }
        }

        stage('Approval') {
            steps {
                script {
                    // Wait for manual approval
                    input message: "Do you want to apply these Terraform changes?", ok: "Yes, Apply"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                ansiColor('xterm') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
}
