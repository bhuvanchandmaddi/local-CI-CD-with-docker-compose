# local-CI-CD-with-docker-compose
This project was focused to create a complete CI/CD pipeline by installing all componenets locally in a single machine using docker-compose.
It will install Jenkins,Sonarqube,Ansible,Slaves for ansible,Jenkins etc, everything as containers
Kubernetes cluster was alos created locally in the same machine using minikube

## Spin up container for infra setup

```
# To execute dind(docker inside docker we need this)
export DOCKER_GID=$(getent group docker | cut -d: -f3)
docker-compose up --build
docker-compose up -d
```