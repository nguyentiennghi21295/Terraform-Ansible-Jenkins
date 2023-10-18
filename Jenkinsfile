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
                sh 'ansible-playbook Playbooks/main-playbook.yml -i aws_hosts --private-key ="-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----"'
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