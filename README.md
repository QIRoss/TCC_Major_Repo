# TCC_Major_Repo

Jenkins first steps:
```
#pull image
docker pull jenkins/jenkins
#run image
docker run -d -p 8080:8080 -v jenkins_volume:/var/jenkins_home --name my_jenkins jenkins/jenkins
#capture initial password
docker exec my_jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```