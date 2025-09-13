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
                wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'xterm']) {
                    sh 'terraform init'
                }
            }
        }

        stage('Plan') {
            steps {
                wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'xterm']) {
                    sh 'terraform plan'
                }
            }
        }

        stage('Apply / Destroy') {
            steps {
                wrap([$class: 'AnsiColorBuildWrapper', 'colorMapName': 'xterm']) {
                    sh 'terraform apply'
                }
            }
        }
    }
}
