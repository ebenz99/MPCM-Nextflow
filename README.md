# MPCM-Nextflow

## Local Directions

1. Download the anaconda3 docker image with the command `docker pull continuumio/anaconda3`
2. (Deprecated) Start anaconda with `docker run -i -t continuumio/anaconda3 /bin/bash`
3. Build the docker image with `docker build -t python-mpcm .`
4. Run the docker image with `docker run python-mpcm`

## Updating Image and Pushing to DockerHub
1. Rebuild the docker image locally with `docker build -t mympcm .`
2. Ensure you're logged in with `docker login`
3. Tag your update with `docker tag mympcm ebensma/mpcm:updated`
4. Push it to dockerhub with `docker push ebensma/mpcm:updated`

## Using this Repo
1. Login to Nautilus
2. Download the config file and put in `~/.kube/`
3. Clone this repo
4. Create a kustomization.yaml 


spec:
  containers:
  - image: ebensma/mpcm:newest
    name: mympcm
    volumeMounts:
    - mountPath: /cache
      name: cache-volume
  volumes:
  - name: cache-volume
    emptyDir: {}

## From Scratch -- NRP Directions

1. Login to Nautilus
2. Download the config file and put in `~/.kube/`
3. Create your docker image and push it to dockerhub
4. Create `kustomization.yaml` file via directions from this link: https://kubernetes.io/docs/concepts/containers/images/#specifying-imagepullsecrets-on-a-pod . Your server is `docker.io`.
5. Create a `nextflow.config` file
8. Run with `nextflow kuberun ebenz99/MPCM-Nextflow -latest`

## Good to Know Things
1. `main.nf` is run from the github version -- remember to commit your changes!
1. Peek into a pod with `kubectl logs <podname>`
2. Delete all pods with `kubectl delete pod --all`
3. View pod statuses with `kubectl get pods`
4. Log into your persistent volume claim in the terminal window with `nextflow kuberun login`
4. Nextflow looks first in your working directory for your `nextflow.config` file, then in your `~/.nextflow/` folder
6. If your stuff won't run from Github because changes need to be pulled, log into your PVC and delete your github repo, whose path will probably exist at `<local-working-dir>/projects/<github-username>/<repo-name>`
7. If your `nextflow.config` seems like it won't uncache, that's because sometimes it doesn't uncache certain attributes. To clear the cache, navigate to `<local-working-dir>/.nextflow/cache` in your PVC and remove all files
