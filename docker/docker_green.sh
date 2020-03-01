cp dockerfile_green dockerfile 
sudo docker build -t hello-world-green .
sudo docker tag hello-world-green kthatimatla/green
sudo docker push kthatimatla/green
oc rollout latest dc/green
