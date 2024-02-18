# TCC_Major_Repo

docker pull jenkins/jenkins
docker run -d -p 8080:8080 -v jenkins_volume:/var/jenkins_home --name my_jenkins jenkins/jenkins