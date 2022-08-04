# Livepeer-Docker-Portainer-Guide

A guide for Orchestrators looking to improve operational efficiency, specifically those running a multi-node setup.

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