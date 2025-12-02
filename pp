build now

6)kubernetes---minikube
pre requisites:
1)docker desktop-running
2)Docker image

name= mynginx
minikube start --driver=docker
kubectl create deployment <name> --image=<image>
kubectl get pods
kubectl describe pod <pod>
docker pull <image>
minikube image load <image>
kubectl rollout restart deployment/<name>
kubectl expose deployment <name> --type=NodePort --port=80 --target-port=80
minikube service <name>
kubectl port-forward svc/<name> 8080:80
kubectl scale deployment <name> --replicas=4
kubectl get deployments
kubectl get pods

7)nagios:
pre requisites:
1)docker

docker pull jasonrivers/nagios:latest
docker run -d -p 6969:80 jasonrivers/nagios:latest
username: nagiosadmin
pwd: nagios
click on hosts

8)aws  if not working yum
sudo su
sudo apt-get update
sudo apt-get install docker.io
sudo docker --version
sudo docker images
sudo docker ps
https://github.com/archanareddyse/mavenweb.git --- git clone http of maven application  
cd mavenweb --- cd maven-web folder name
sudo docker build -t img1 .
sudo docker images
sudo docker run -d -p 80:8080 img1
https://3.238.171.121/ ---> http://3.238.171.121:80

9)uml-use-case,class diagram,sequence dig,component diagram
case-studies --- ors,lmg,hmg,book bankings,atm
