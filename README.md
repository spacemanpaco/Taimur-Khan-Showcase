# Taimur-Khan-Showcase
Azure Cloud Network Configuration with ELK Server

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Diagrams/ELK.VNET.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Ansible directory such as filebeat-playbook.yml, to only download select files such as Filebeat.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly efficient and optimized for increased traffic load, in addition to restricting access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the system and system metrics.

The configuration details of each machine may be found below.

| Name       | Function    | IP Address | Operating System |
|------------|-------------|------------|------------------|
| RedTeam VM | Gateway     | 10.0.0.4   | Linux            |
| Web-1      | DVWA Server | 10.0.0.5   | Linux            |
| Web-2      | DVWA Server | 10.0.0.6   | Linux            |
| Web-3      | DVWA Server | 10.0.0.7   | Linux            |
| ELK-Server | ELK Stack   | 10.1.0.4   | Linux            |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the RedTeam virtual machine can accept connections from the Internet. The Load balancer has a Public IP to allow public users to connect to the servers that have been set up. Access to this machine is only allowed from the following IP addresses:
- 67.70.83.162 (User)

Machines within the network can only be accessed by RedTeam virtual machine from IP address 10.0.0.4.

A summary of the access policies in place can be found in the table below.

| Name                  | Publicly Accessible | Allowed IP Addresses |
|-----------------------|---------------------|----------------------|
| RedTeam VM            | No                  | 67.70.83.162         |
| RedTeam Load Balancer | Yes                 | Any Public IP        |
| Web-1                 | No                  | 10.0.0.4             |
| Web-2                 | No                  | 10.0.0.4             |
| Web-3                 | No                  | 10.0.0.4             |
| ELK-Server            | No                  | 10.0.0.4             |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because this playbook can be deployed to new networks with new VMs that can be included in the configuration.

The playbook implements the following tasks:
- First in the hosts file in the /etc/ansible directory, the servers must be specified so the playbook knows which servers to install ELK on
- The script will install docker module on the VM so the container can be pulled from docker hub
- Next it will install pip3 in tandem with creating a custom Python Virtual environment which ELK can process logs
- The Python Docker module will be installed next which can process logs
- The virtual memory will need to be increased as logs need to be stored for security monitoring
- Lastly the docker module will pull the docker container with the image for the ELK server to be used to monitor the peered network

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(Diagrams/Docker.ps.jpg)

### Target Machines & Beats

This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.5
- Web-2 10.0.0.6
- Web-3 10.0.0.7

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Metricbeat will monitor the system load for requests being made to the server
- Filebeat will monitor system log files, such as information on types of requests and where they may come from

### Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to /etc/ansible
- Update the hosts file to include private IP address of ELK Server, the YAML scripts will specify which servers to run ELK on
- Run the playbook, and navigate to 168.62.202.196:5601/app/kibana to check that the installation worked as expected
- The IP is of the ELK server and will only accept connections from port 5601 as specified


### Commands to Install Repository and ELK

git clone https://github.com/spacemanpaco/Taimur-Khan-Showcase.git - Install Repository on your machine

cp install-elk.yml /etc/ansible - Copies Install Elk file into ansible directory

nano hosts - Update file to include private IP address of ELK-Server to specify script to run on this server

ansible-playbook install-elk.yml - Run Playbook on specified ELK server

curl http://168.62.202.196:5601/app/kibana

Make sure VM that needs ELK installed on it is running to see an output. 



