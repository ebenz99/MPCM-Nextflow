# Kubernetes

## Setup
1. To run on kubernetes cluster, download info from cluster in `config` file stored in `~/.kube/`
2. Use `kustomization.yaml` with info from here https://kubernetes.io/docs/concepts/containers/images/#specifying-imagepullsecrets-on-a-pod

## Pod Status
1. `kubectl log <podname>` - shows what's going on in a specific pod
2. `kubectl get pods` - shows all pods and their statuses

## Volumes
1. `kubectl create <volume>` - creates a kubernetes volume
2. `kubectl create -f pod.yaml` - creates a volume as specified by yaml file

## Running
1. `kubectl run <name> --image=<docker_username>/<image>:tag` - runs docker container on pod


# Docker

## Making image
1. Create `Dockerfile`
2. Build the docker image with `docker build -t python-mpcm .`

## Push to DockerHub
1. Log in on CL with `docker login`
2. Tag your update with `docker tag <image_name> <username>/< image_name>:<tag>`
3. Push it to dockerhub with `docker push <username>/<image_name>:<tag>`

## Run with mounted volume
1. Your `ENTRYPOINT`s and `CMD`s in Dockerfile will be ignored when it's run with Nextflow/Kubernetes


# Nextflow

## Running jobs
1. Run a job from `main.nf` in git repository with `nextflow kuberun ebenz99/MPCM-Nextflow -latest`

`Users/ebensman/code/workspaces/MPCM/projects/ebenz99/MPCM-Nextflow/`