pipeline {
    agent any

    environment {
        // Set environment variables
        TERRAFORM_VERSION = '1.7.5' 
        AWS_REGION = 'eu-north-1'
    }

    stages {
        stage('Install Terraform') {
            steps {
                sh """
                # Download and install Terraform
                curl -o terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
                unzip terraform.zip
                sudo mv terraform /usr/local/bin/
                terraform --version
                """
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=plan.out'
            }
        }
        stage('Terraform Apply') {
            steps {
                input message: 'Do you want to apply the Terraform plan?', ok: 'Apply'
                sh 'terraform apply -auto-approve plan.out'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
