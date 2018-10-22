pipeline {
    agent {
        label "java"
    }

    stages {
        stage("Build Update Center") {
            steps{
                sh 'make update-center'
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