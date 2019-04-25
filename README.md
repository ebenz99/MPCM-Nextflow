# MPCM-Nextflow

## Prerequisites

To run this repo, you must have previously installed: 

1. Nextflow
2. Kubernetes
3. Docker (if you want to modify)


## Directions

1. Login to Nautilus
2. Download the config file and put in `~/.kube/`
3. Clone this repo
4. Run with `nextflow kuberun ebenz99/MPCM-Nextflow -latest`
5. Save data with cd



## From Scratch -- NRP Directions

1. Login to Nautilus
2. Download the config file and put in `~/.kube/`
3. Create your docker image and push it to dockerhub
5. Create a `nextflow.config` file
8. Run with `nextflow kuberun <github-username>/<MPCM-repo> -latest`
5. Save data with `./kube-save.sh <PVC> projects/ebenz99/MPCM-Nextflow/Mechanistic_Pan-Cancer_Model/op`

### Building and testing with Docker

1. Create a Dockerfile
3. Build the docker image with `docker build -t <image-name> .`
2. Ensure you're logged in with `docker login`
3. Tag your update with `docker tag <name> <username>/<image-name>:<tag>`
4. Run the docker image with `docker run <image-name>`
4. Push it to dockerhub with `docker push <username>/<image-name>:<tag>`

## Good to Know Things
1. The Feltus PVC is `deepgtex-prp`
1. `main.nf` is run from the github version -- remember to commit your changes!
1. Peek into a pod with `kubectl logs <podname>`
2. Delete all pods with `kubectl delete pod --all`
3. View pod statuses with `kubectl get pods`
4. Log into your persistent volume claim in the terminal window with `nextflow kuberun login`
4. Nextflow looks first in your working directory for your `nextflow.config` file, then in your `~/.nextflow/` folder
6. If your stuff won't run from Github because changes need to be pulled, log into your PVC and delete your github repo, whose path will probably exist at `<local-working-dir>/projects/<github-username>/<repo-name>`
7. If your `nextflow.config` seems like it won't uncache, that's because sometimes it doesn't uncache certain attributes. To clear the cache, navigate to `<local-working-dir>/.nextflow/cache` in your PVC and remove all files
8. If you need a `kustomization.yaml`, go here for directions: https://kubernetes.io/docs/concepts/containers/images/#specifying-imagepullsecrets-on-a-pod. Your server is `docker.io`.
