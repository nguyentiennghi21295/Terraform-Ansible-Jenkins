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
                sh 'cat main.tfvars'
                sh 'terraform init -no-color'
            }
        }
        stage('Plan') {
            steps {
                sh 'terraform plan -no-color'
            }
        }
        stage('Validate Apply') {
            when {
                beforeInput true
                branch "main"
            }
            input {
                message "Do you want to apply this plan?"
                ok "Apply this plan"
            }
            steps {
                echo 'Apply Accepted'
            }
        }
        stage('Apply') {
            steps {
                sh 'terraform apply -auto-approve -no-color -var-file=main.tfvars'
            }
        }
        stage('Inventory') {
          steps {
                sh '''printf \\
                    "\\n$(terraform output -json instance_ips | jq -r \'.[]\')" \\
                    >> aws_hosts'''
            }
        }
        stage('EC2 Wait') {
            steps {
                sh '''aws ec2 wait instance-status-ok \\
                    --instance-ids $(terraform show -json | jq -r \'.values\'.\'root_module\'.\'resources[] | select(.type == "aws_instance").values.id\') \\
                    --region eu-west-1'''
            }
        }
        stage('Echo') {
            steps {
                 sh 'cat aws_hosts'
            }
        }
        stage('Validate Ansible') {
            when {
                beforeInput true
                branch "main"
            }
            input {
                message "Do you want to run Ansible?"
                ok "Run Ansible"
            }
            steps {
                echo 'Ansible Approved'
            }
        }
        stage('Ansible') {
            steps {
                ansiblePlaybook(credentialsId: 'ec2-ssh-key', inventory: 'aws_hosts', playbook: 'playbooks/main-playbook.yml')
            }
        }
        stage('Validate Destroy') {
            input {
                message "Do you destroy all the things?"
                ok "Destroy!"
            }
            steps {
                echo 'Destroy Accepted'
            }    
        }
        stage('Destroy') {
            steps {
                sh 'terraform destroy -auto-approve -no-color -var-file=main.tfvars'
            }
        }
        }
    post {
        success {
            echo 'Success!'
        }
        failure {
            sh 'terraform destroy -auto-approve -no-color -var-file=main.tfvars'
        }
        aborted {
            sh 'terraform destroy -auto-approve -no-color -var-file=main.tfvars'
        }
    }
    
}