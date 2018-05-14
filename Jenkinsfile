pipeline {
    agent any
    tools {
        "org.jenkinsci.plugins.terraform.TerraformInstallation" "terraform-0.11.7"
    }
    parameters {
        string(name: 'WORKSPACE', defaultValue: 'development', description:'worspace to use in Terraform')
    }
    environment {
        TF_HOME = tool('terraform-0.11.7')
        TF_IN_AUTOMATION = "true"
        PATH = "$TF_HOME:$PATH"
    }
    stages {
        stage('NetworkInit'){
            steps {
                dir('terraform/'){
                    sh "terraform init"
                    sh "echo \$PWD"
                    sh "whoami"
                }
            }
        }

}
}
