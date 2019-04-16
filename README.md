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


## NRP Directions

1. Login to Nautilus
2. Download the config file and put in ~/.kube/
3. Push image to docker
4. Create a volume with docker create volume my-vol
4. Create `kustomization.yaml` file via directions from this link: https://kubernetes.io/docs/concepts/containers/images/#specifying-imagepullsecrets-on-a-pod
5. Your server is docker.io
6. Run with `kubectl run mpcm1 --image=ebensma/mpcm:tag` where word after colon is the tag
7. Once `kubecl get pods` shows your pod has restarted, copy the data to local with `kubectl cp <some-namespace>/<some-pod>:/tmp/foo /tmp/bar`
8. Run with `nextflow kuberun ebenz99/MPCM-Nextflow -latest -v deepgtex-prp:/Users/ebensman/code/workspaces/MPCM`

## Good to Know Things
1. Peek into a pod with `kubectl logs <podname>`
