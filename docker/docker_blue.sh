cp dockerfile_blue dockerfile 
sudo docker build -t hello-world-blue .
sudo docker tag hello-world-blue kthatimatla/blue
sudo docker push kthatimatla/blue
oc rollout latest dc/blue
