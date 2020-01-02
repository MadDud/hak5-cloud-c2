# cloudc2docker
A Docker container for Hak5's Cloud C2.

## Built On
* Ubuntu 18.04.3
* Docker 19.03.5

## Setup

#### Step 1:
Clone this repository on a server with Docker.

#### Step 2:
Edit the start.sh file and set the hostname to whatever you want. 

#### Step 3:
Build the container:
```
sudo docker build -t faithfulst3ward.dev/cloudc2docker .
```
#### Step 4:
Run the container and complete setup:
```
sudo docker run --name=cloudc2docker --restart=always -v cloudc2:/app -p 2022:2022 -p 8080:8080 faithfulst3ward.dev/cloudc2docker
```
#### Step 5:
Once setup is complete, stop the docker container from another terminal window, and restart it.
```
sudo docker stop cloudc2docker
sudo docker start cloudc2docker
```

## Backup
To make a backup of your data, run the following command on your server:
```
sudo docker run --rm --volumes-from cloudc2docker -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /app
```
