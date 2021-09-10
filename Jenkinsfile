pipeline {
    agent { label 'docker' }
    options {
        disableConcurrentBuilds()
    }
    environment {
        DEV_MAIL = "vadim.koshman@mainsoft.org"
        DOCKER_BUILD_IMAGE = 'maven:3.8.4-openjdk-11-slim'
        DOCKER_BUILD_IMAGE_SONAR = "sonarsource/sonar-scanner-cli:4.6"
        GIT_COMMIT_SHORT = "${env.GIT_COMMIT.take(7)}"
        REGISTRY = "952651576143.dkr.ecr.eu-central-1.amazonaws.com"
        REGISTRYCREDENTIAL = 'ecr:eu-central-1:praesideo-ecr-user'
        APP = 'praesideo-backend'
        SSH_PRIVATE_KEY = "jenkins_rsa"
        DEPENDENCYTRACK = "Dependency-Track"
        }

    stages {
        stage('Show ENV') {
          steps {
            script {
              withCredentials([file(credentialsId: "praesideo-backend-sit", variable: 'ENV_sit'),
                              file(credentialsId: "praesideo-backend-uat", variable: 'ENV_uat'),
                              file(credentialsId: "praesideo-backend-prod", variable: 'ENV_prod')]) {
                  sh "cat $ENV_sit"
                  sh "cat $ENV_uat"
                  sh "cat $ENV_prod"
              }
            }
          }
        }      
        stage('Set ENV for branch dev') {
          when { branch 'dev' }
          steps {
            script {
              PORT = "22"
              IP_ADDRESS = "ec2-3-123-234-136.eu-central-1.compute.amazonaws.com"
              SEC_ENV_FILE = "praesideo-backend-sit"
              SSH_USER = "root"
              PROFILES_ACTIVE = "sit"
            }
            echo "PORT = $PORT"
            echo "IP_ADDRESS = $IP_ADDRESS"
            echo "Branch = $BRANCH_NAME"
          }
        }
        stage('Set ENV for branch stage') {
          when { branch 'stage' }
          steps {
            script {
              PORT = "22"
              IP_ADDRESS = "ec2-3-65-190-58.eu-central-1.compute.amazonaws.com"
              SEC_ENV_FILE = "praesideo-backend-uat"
              SSH_USER = "root"
              PROFILES_ACTIVE = "uat"
            }
            echo "PORT = $PORT"
            echo "IP_ADDRESS = $IP_ADDRESS"
            echo "Branch = $BRANCH_NAME"
          }
        }
        stage('Set ENV for branch master') {
          when { branch 'master' }
          steps {
            script {
              PORT = "22"
              IP_ADDRESS = "ec2-18-193-16-169.eu-central-1.compute.amazonaws.com"
              SEC_ENV_FILE = "praesideo-backend-prod"
              SSH_USER = "root"
              PROFILES_ACTIVE = "prod"
            }
            echo "PORT = $PORT"
            echo "IP_ADDRESS = $IP_ADDRESS"
            echo "Branch = $BRANCH_NAME"
          }
        }
        // stage('SonarQube') {
        //     agent {
        //         docker {
        //             image "$DOCKER_BUILD_IMAGE_SONAR"
        //             reuseNode true
        //             args '--entrypoint='
        //         }
        //     }
        //     steps {
        //       withSonarQubeEnv('SonarQube') {
        //         sh "sonar-scanner -Dsonar.projectKey=$APP -Dsonar.java.binaries=./modules/server/src/main/java/earth/praesideo"
        //       }
        //     }
        // }
        stage('Maven Build') {
            agent {
                docker {
                    image "$DOCKER_BUILD_IMAGE"
                    reuseNode true
                }
            }
            steps {
                sh 'env'
                sh 'ls -la'
                sh 'mvn clean package -Pdev'
                // sh 'ls -la ./modules/server/target/'
                // sh 'mvn org.cyclonedx:cyclonedx-maven-plugin:2.5.3:makeAggregateBom -DoutputFormat=json'
            }
        }
        // stage('DependencyTrackPublisher') {
        //     steps {
        //         withCredentials([string(credentialsId: "$DEPENDENCYTRACK", variable: 'API_KEY')]) {
        //             dependencyTrackPublisher artifact: 'target/bom.json', projectName: "$APP", projectVersion: "$APP", synchronous: true, dependencyTrackApiKey: API_KEY
        //         }
        //     }
        // }
        stage('Load Files') {
             steps {
                // configFileProvider([configFile(fileId: 'run_prod.py', targetLocation: './run_prod.py')]) {
                // }
                configFileProvider([configFile(fileId: 'temperature_config.yaml', targetLocation: './config.yaml')]) {
                }
                sh 'ls -la'
             }
         }
        stage('Building our image') {
            steps {
              script {
                sh 'cat Dockerfile'
                DOCKERIMAGE = docker.build(registry + "/$APP:$GIT_COMMIT_SHORT",
                              "--build-arg GIT_COMMIT=$GIT_COMMIT"
                              + " ."
                          )
                }
            }
        }
        stage('Deploy our image') {
            steps {
              script {
                docker.withRegistry( "https://" + REGISTRY + "/$APP:$GIT_COMMIT_SHORT", REGISTRYCREDENTIAL ) {
                    DOCKERIMAGE.push()
                    }
                }
            }
        }
        stage('Cleaning up') {
            steps {
                sh "docker rmi $registry/$APP:$GIT_COMMIT_SHORT"
            }
        }
        stage('deploy'){
            environment {
              PORT = "$PORT"
              IP_ADDRESS = "$IP_ADDRESS"
              SSH_USER = "$SSH_USER"
            }
            steps{
              script {
                sh "envsubst < docker-compose.yml > $BRANCH_NAME-docker-compose.yml"
                withCredentials([file(credentialsId: "$SEC_ENV_FILE", variable: 'ENV_FILE')]) {
                  writeFile file: 'env', text: readFile(ENV_FILE)
                }
                sshagent (credentials: ["$SSH_PRIVATE_KEY"]) {
                  docker.withServer("ssh://$SSH_USER@$IP_ADDRESS") {
                     docker.withRegistry( "https://" + REGISTRY, REGISTRYCREDENTIAL ) {
                       sh "docker pull $REGISTRY/$APP:$GIT_COMMIT_SHORT"
                       sh "ssh -o StrictHostKeyChecking=no -T $SSH_USER@$IP_ADDRESS mkdir -p /opt/temperature_alignment"
                       sh "docker stack deploy --compose-file $BRANCH_NAME-docker-compose.yml --with-registry-auth $APP"
                       sh '''
                          sleep 60s
                          HOSTNAME=$(ssh -o StrictHostKeyChecking=no -T $SSH_USER@$IP_ADDRESS hostname)
                          for i in `seq 1 10`;
                          do
                            STATUS=$(ssh -o StrictHostKeyChecking=no -T $SSH_USER@$IP_ADDRESS curl -o /dev/null -s -w %{http_code} http://$HOSTNAME:8080/api/public/healthcheck)
                            if [ $STATUS -eq 200 ]; then
                              docker service ls --filter name="${APP}_${APP}"
                              break
                            fi
                            sleep 10s
                            false
                          done || exit 1
                      '''
                    }
                  }
                }
              }
            }
            post {
              success {
                echo "Deploy $APP success"
              }
              failure {
                script {
                  echo "Service update failed"
                  sshagent (credentials: ["$SSH_PRIVATE_KEY"]) {
                   docker.withServer("ssh://$SSH_USER@$IP_ADDRESS") {
                     sh "docker service logs -n 70 ${APP}_${APP}"
                     sh "docker service update --rollback ${APP}_${APP}"
                    }
                  }
                }
              }
            }
         }
    }
    post {
        always {
            echo "Clean up workspace"
            deleteDir()
        }
    }
}
