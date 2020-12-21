# cloudc2docker
A Docker container for Hak5's Cloud C2 - https://docs.hak5.org/hc/en-us/articles/360012947534-About-Cloud-C2

## Built On
* Ubuntu 18.04.3
* Docker 19.03.5

## Setup

#### Step 1:
Clone this repository on a server with Docker.

#### Step 2:
Edit the start.sh file and replace "your.hostname.here.com" to whatever you want. 

#### Step 3:
Build the container:
```
sudo docker build -t MadDud/hak5-cloud-c2 .
```
#### Step 4:
Run the container and complete setup:
```
docker run --name=hak5-cloud-c2 --restart=always -p 2022:2022 -p 8080:8080 MadDud/hak5-cloud-c2
```
#### Step 5:
Once setup is complete, stop the docker container from another terminal window, and restart it.
```
docker stop cloudc2docker
docker start cloudc2docker
```

## Remarks

Repository originally cloned from https://gitlab.com/faithfulst3ward/cloudc2docker/-/tree/master
