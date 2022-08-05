sudo docker network create portainer 
sudo docker volume create portainer_data
sudo docker volume create traefik

sudo docker network list
sudo docker volume list

sudo mkdir /var/lib/docker/volumes/traefik/_data/certs
sudo chmod 600 /var/lib/docker/volumes/traefik/_data/certs

ls -al /var/lib/docker/volumes/traefik/_data/