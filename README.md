[Gradle Project on Docker]

gradle-project 디렉토리 이동 $ cd gradle-project
소스코드 빌드 $ ./gradlew build
이미지 빌드 $ docker build -t gradle-project:0.0.1 .
이미지 실행 $ docker run -d --name gradle-project -p 8001:8080 gradle-project:0.0.1

[Maven Project on Docker]

maven-project 디렉토리 이동 $ cd maven-project
소스코드 빌드 $ ./mvnw package
이미지 빌드 $ docker build -t maven-project:0.0.1 .
이미지 실행 $ docker run -d --name maven-project -p 8002:8080 maven-project:0.0.1

[NodeJS Project on Docker]

nodejs-project 디렉토리 이동 $ cd nodejs-project
이미지 빌드 $ docker build -t nodejs-project:0.0.1 .
이미지 실행 $ docker run -d --name nodejs-project -p 8003:8080 nodejs-project:0.0.1

##KKK