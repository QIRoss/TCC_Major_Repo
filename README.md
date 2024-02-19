# TCC_Major_Repo

Jenkins first steps:
```
docker image build -t custom-jenkins-docker .
docker run -d -it -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home --network jenkins_network --name my_jenkins custom-jenkins-docker
docker exec my_jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```