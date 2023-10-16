pipeline {
    agent any
    environment {
        TF_IN_AUTOMATION = 'true'
        TF_CLI_CONFIG_FILE = credentials('Terraform-cloud-secrets')
    }
    stages {
        withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            credentialsId: 'AWS-creds'
        ]]){
            stage('Init') {
                steps {
                    sh 'ls'
                    sh 'terraform init -no-color'
                }
            }
            stage('Plan') {
                steps {
                    sh 'terraform plan -no-color'
                }
            }
            stage('Apply') {
                steps {
                    sh 'terraform apply -auto-approve -no-color'
                }
            }
            stage('EC2 Wait') {
                steps {
                    sh 'aws ec2 wait instace-status-ok --region eu-west-1'
                }
            }
            stage('Destroy') {
                steps {
                    sh 'terraform destroy -auto-approve -no-color'
                }
            }
            }
            }
}