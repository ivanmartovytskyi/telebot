pipeline {
    agent any
    parameters {
        choice(name: 'OS', choices: ['linux', 'darwin', 'windows', 'all'], description: 'Pick OS')
        choice(name: 'ARCH', choices: ['amd64', 'arm64'], description: 'Pick ARCH')
    }
    environment {
        REPO = "https://github.com/ivanmartovytskyi/telebot"
        BRANCH = 'main'
    }
    stages {
        stage("clone") {
            steps {
                echo 'Clone stage'
                git branch: "${BRANCH}", url: "${REPO}"
            }
        }
        stage("test") {
            steps {
                echo 'Test stage'
                sh "make --version"
                sh 'make test'
            }
        }
        stage("build") {
            steps {
                echo 'Build stage'
                sh 'make build'
            }
        }
        stage("image") {
            steps {
                script {
                    echo 'Make image stage'
                    sh 'make image'
                }
            }
        }
        stage("push") {
            steps {
                script {
                    echo 'Push image stage'
                    docker.withRegistry('', 'dockerhub') {
                        sh 'make push'
                    }
                }
            }
        }
        stage("clean") {
            steps {
                script {
                    echo 'Clean image stage'
                    docker.withRegistry('', 'dockerhub') {
                        sh 'make clean'
                    }
                }
            }
        }
    }
}