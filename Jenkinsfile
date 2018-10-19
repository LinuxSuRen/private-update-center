pipeline {
    agent {
        label "java"
    }

    stages {
        stage("checkout") {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/fea/cache']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/LinuxSuRen/update-center2']]])
            }
        }

        stage("build") {
            steps{
                container('java'){
                    sh 'mvn clean package appassembler:assemble -DskipTests'
                }
            }
        }

        stage("genereate") {
            steps{
                sh 'sh target/appassembler/bin/app -id test -www www -maxPlugins 1'
            }
        }

        stage("docker") {
            steps {
                container('tools'){
                    withCredentials([usernamePassword(credentialsId: 'b37a5fa7-ca58-4de4-b8c9-54411fe36ef8',
                        passwordVariable: 'passwd', usernameVariable: 'user')]) {
                        sh '''
                        docker login index.alauda.cn/alaudak8s -u $user -p $passwd
                        docker build . -t index.alauda.cn/alaudak8s/test
                        docker push index.alauda.cn/alaudak8s/test
                        '''
                    }
                }
            }
        }
    }
}