pipeline {
    agent any
    environment {
        TF_IN_AUTOMATION = 'true'
        TF_CLI_CONFIG_FILE = credentials('Terraform-cloud-secrets')
    }
    stages {
        stage('Init') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'AWS-creds'
                ]]){
                    sh 'ls'
                    sh 'terraform init -no-color'
                }
            }
        }
        stage('Plan') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'AWS-creds'
                ]]){
                    sh 'terraform plan -no-color'
                }
            }
        }
        stage('Apply') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'AWS-creds'
                ]]){
                    sh 'terraform apply -auto-approve -no-color'
                }
            }
        }
        stage('EC2 Wait') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'AWS-creds'
                ]]){
                    sh 'aws ec2 wait instance-status-ok --region eu-west-1'
                }
            }
        }
        stage('Destroy') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'AWS-creds'
                ]]){
                    sh 'terraform destroy -auto-approve -no-color'
                }
            }
        }
    }
}
