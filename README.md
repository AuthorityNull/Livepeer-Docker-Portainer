# Livepeer-Docker-Portainer

A guide for Orchestrators looking to improve operational efficiency, specifically those running a multi-node setup.
https://forum.livepeer.org/t/guide-livepeer-with-docker-and-portainer-for-operating-at-scale/1850

# Directories

Each Directory included in this repo.

## docker-volumes

All the files needed to prepare your Livepeer, Monitoring, and Portainer docker volumes.
(lpdata, prometheus-config, and traefik volumes)

## linux-scripts

Linux scripts to aide running the necessary server installation and configuration setup.

## portainer

The docker compose file to run the Portainer UI and Edge Server

## livepeer-combined

The Portainer Template for the Livepeer Combined O/T use case

## livepeer-standalone

The Portainer Template for the Livepeer Standalone O use case

## livepeer-transcoder

The Portainer Template for the Livepeer Transcoder use case

## monitor

The Portainer Template for the Grafana,Prometheus Monitoring use case

# Placeholders

Make sure you edit each file and replace the following placeholder values:

```
eth_acct.json - YOUR_ETH_ACCT_JSON
eth_secret.json - YOUR_ETH_ACCT_PASSWORD
orch_secret.txt - YOUR_ORCH_SECRET
lpcombined.conf - YOUR_ETH_ACCT_ADDRESS, YOUR_ORCH_IP
lporchestrator.conf - YOUR_ETH_ACCT_ADDRESS, YOUR_ORCH_IP
lptranscoder.conf - YOUR_ORCH_IP
traefik.yml - email@domain.com

# Optional - linux-scripts
run_edge_agent.sh - YOUR_EDGE_KEY, YOUR_EDGE_ID
```

# Portainer Agent
In the walkthrough video, Mike Zupper is unable to browse volumes on the local Portainer server. Generally, when setting up Livepeer for production, you'll want to install Portainer on a server separate from any Livepeer nodes, that way you won't need to browse volumes on the Portainer server. That being said, the way around this limitation is to simply install a Portainer agent on the Portainer server. To do this, copy and paste this code at the bottom of the `docker-compose.yml` file we created on the Portainer server. 

**Note:** Since this agent will also be proxied by Traefik, you must create another DNS record and replace ```agent.example.com``` with it.

```
    agent:
      image: portainer/agent
      container_name: "agent"
      restart: unless-stopped
      depends_on:
        - traefik
      volumes:
        - /var/run/docker.sock:/var/run/docker.sock
        - /var/lib/docker/volumes:/var/lib/docker/volumes
      labels:
        - "traefik.enable=true"
        - "traefik.http.routers.portainer_agent.entrypoints=websecure"
        - "traefik.http.routers.portainer_agent.rule=Host(`agent.example.com`)"
        - "traefik.http.routers.portainer_agent.service=agent"
        - "traefik.http.services.portainer_agent.loadbalancer.server.port=9001"
        - "traefik.http.routers.portainer_agent.tls.certresolver=production"
  ```
 
Bring the docker-compose.yml stack up and log into Portainer like you normally would. 
You'll see a new environment called ```agent```: 

![Agent_env](https://user-images.githubusercontent.com/95463891/184393360-9892316e-751e-4119-b8fa-f1c40b36e101.PNG)

This new environment is exactly the same as the ```local``` environment but gives us some more options to play with.

Click into the environment. 

Click ```Host```.

Click ```Setup```.

Turn on ```Enable host management features``` and  ```Enable volume management for non-administrators```.

![Click_Host](https://user-images.githubusercontent.com/95463891/184395091-bebe9880-adaf-4db4-a4ce-90bf60281c56.PNG)

![Enable_Permissions](https://user-images.githubusercontent.com/95463891/184395093-cfa80827-cfcd-433d-932b-68f8c3830d4c.PNG)

You can now navigate to volumes inside the agent environment and browse.


 
