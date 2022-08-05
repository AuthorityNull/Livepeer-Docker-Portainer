export EDGE_KEY="YOUR_EDGE_KEY";
export EDGE_ID="YOUR_EDGE_ID";
docker run -d -v /var/run/docker.sock:/var/run/docker.sock  -v /var/lib/docker/volumes:/var/lib/docker/volumes   -v /:/host   -v portainer_agent_data:/data   --restart always   -e EDGE=1   -e EDGE_ID=$EDGE_ID   -e EDGE_KEY=$EDGE_KEY   -e EDGE_INSECURE_POLL=1   --name portainer_edge_agent   portainer/agent:latest