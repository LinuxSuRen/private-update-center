pipeline {
    agent any

    stages {
        stage("checkout") {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/fea/cache']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/LinuxSuRen/update-center2']]])
            }
        }

        stage("build") {
            steps{
                sh 'mvn clean package appassembler:assemble -DskipTests'
            }
        }

        stage("genereate") {
            steps{
                sh 'sh target/appassembler/bin/app -id test -www www -maxPlugins 1'
            }
        }
    }
}