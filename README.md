

This document is a WIP 

## Simulation of DDoS Attacks (SODA) Lab 

This an overview of the lab used for Simulation of DDoS Attacks (SODA) testing with a focus on Docker containers. With the provided instructions and config files, you can configure a lab to test DDOS posture with SODA. You can modify the config files to fit your needs or you use them as a reference to incorporate the SODA lab components into your existing lab.

## About the Lab

In our lab, we have virtualized a portion of the environment to simplify the setup. We deployed both VMWare ESXi and Docker containers. In the network diagram, VMWare guests are green, Docker containers are blue and hardware appliances are black. We installed Ubuntu as VM guests to serve as Docker Hosts. 

## Lab Diagram

![Lab Diagram]
(https://github.com/KEN-Ver1/soda-lab/images/soda-lab-diagram.png)
 


## Lab Hardware
	• Four (4) ESXi Hosts
	• Two (2) Switches, one must support layer 3
	• One (1) DDOS Protection Appliance

## Lab Software
	• Hypervisor: VMWare ESXi 6.5
	• Docker Hosts: Ubuntu 18.04.1 LTS 
	• Firewall: PFSense
	• Network Load Generator: Locust
	• Real-time Metrics Collector and Dashboard: Telegraph, InfluxDB and Grafana
	• Damn Vulnerable Web Application (DVWA)
	• MySQL
	• SODA
 
## Prerequisites – Preconfigured the following
	• VMware hosts
	• Network switches with routes 
	• DDOS Protection appliance
	• PFSense Firewall

## Docker Configuration:

1.	Install four virtual Ubuntu VMs

2.	On the virtual Ubuntu VMs, install Docker and Docker-Compose extension

	a. Update apt package index 
	   *“sudo apt-get update”*

	b. Enable APT for HTTPS
	   *“sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common”*

	c. Add Docker’s GPG key
	   “curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -“

	d. Add Docker stable repository
	   “sudo add-apt-repository   "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable””

	e. Install Docker Engine
	   “sudo apt-get install docker-ce docker-ce-cli containerd.io”

	f. Install Docker Compose into /usr/local/bin  
	   “sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

	g. Apply executable permission to the Docker Compose binary 
	   “sudo chmod +x /usr/local/bin/docker-compose”

3.	Clone Git repos
	a. Git clone https://github.com/464d41/soda.git
	b. Git clone https://github.com/KEN-Ver1/soda-lab

4.	Create the required docker networks using the following commands.

	a. On Ubuntu host 1,2 and 3 run 
	   “sudo docker network create -d macvlan --subnet=10.9.73.128/25 --gateway=10.9.73.254 -o parent=ens192.973 vlan973”

	b. On Ubuntu host 3 and 4 run 
	   “sudo docker network create -d macvlan --subnet=10.11.72.128/25 --gateway=10.11.72.254 -o parent=ens192.1172 vlan1172

5.	Start the Lab-Assets environment

	a. Start docker daemon
	   To start Docker at boot, run “sudo systemctl enable docker”.
	   To start Docker immediately, run “sudo systemctl start docker”.

	b.On Ubuntu host1, run
	  “docker-compose -f  down && d


	docker-compose -f docke-compose.yml up -d

	c.On Ubuntu host2
	d.On Ubuntu host3
	e.On Ubuntu host4, run
	“docker-compose -f xxx.yml down && docker-compose -f docke-compose.yml up -d


	“docker-compose -f docke-compose.yml down && docker-compose -f docke-compose.yml up -d


## References:

##### Docker Installation (Ubuntu): https://docs.docker.com/install/linux/docker-ce/ubuntu/
##### Docker-Compose Installation: https://docs.docker.com/compose/install/
 

