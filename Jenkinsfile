pipeline {
    environment {
        HARBOR_URL = "harbor.clouddari.com"
        CI_PROJECT_PATH = "samsung"
        BRANCH = "develop"
        APP_NAME = "samsung"
    }
    agent {
        kubernetes {
            yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: gradle
    command:
    - sleep
    args:
    - 99d
    image: harbor.clouddari.com/library/gradle:7.1.1
  - name: kaniko
    command:
    - sleep
    args:
    - 99d
    image: harbor.clouddari.com/library/kaniko-project/executor:debug
    volumeMounts:
    - name: dockerconfigjson
      mountPath: /kaniko/.docker/
  - name: helm
    command:
    - sleep
    args:
    - 99d
    image: harbor.clouddari.com/library/alpine/helm:latest
  volumes:  
  - name: dockerconfigjson
    secret:
      secretName: harbor-cred
      items:
      - key: ".dockerconfigjson"
        path: "config.json"
  imagePullSecrets:
  - name: harbor-cred
'''
        }
    }
    stages {
        stage('source build') {
            steps {
                container('gradle') {
                    sh 'echo "source build"'
                }
            }
        }
        stage('image build') {
            steps {
                container('kaniko') {
                    sh '/kaniko/executor --context ./ --dockerfile ./dockerfile --destination $HARBOR_URL/$CI_PROJECT_PATH/$BRANCH/$APP_NAME:$BUILD_TAG'
                }
            }
        }
        stage('deploy') {
            steps {
                container('helm') {
                    sh 'helm upgrade --install --set image.tag=${BUILD_TAG} -n $BRANCH --create-namespace $APP_NAME ./helm-deploy/helm'
                }
            }
        }
    }
}
