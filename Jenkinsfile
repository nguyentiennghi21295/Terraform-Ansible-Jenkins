pipeline {
    agent any
    environment {
        TF_IN_AUTOMATION = 'true'
        AWS_SHARED_CREDENTIALS_FILE = '/home/ubuntu/.aws/credentials'
    }
    stages {
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
                 sh 'aws ec2 wait instance-status-ok --region eu-west-1'
            }
        }
        stage('Ansible') {
            steps {
                ansiblePlaybook(credentialsId: 'ec2-ssh-key1', inventory: 'aws_hosts', playbook:'Playbooks/main-playbook.yml')
            }
        }    
        stage('Destroy') {
            steps {
                sh 'terraform destroy -auto-approve -no-color'
            }
        }
    }
}