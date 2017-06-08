#!/bin/bash
projectName="tech-conf-2017"
nginxContainerName="eu.gcr.io/${projectName}/super-duper-app"

versionNumber=$1
if [ -z "$versionNumber" ]; then
  echo "Please set the version number"
  exit 1
fi

#gcloud auth application-default login

gcloud config set project ${projectName}

echo "check to see if I can connect to project"
gcloud compute instances list
if [ $? -ne 0 ]; then
	>&2 echo "error with gcloud auth"
	exit 1
fi

#build nginx container
gcloud docker -- build -t ${nginxContainerName}:$1 ./

#deploy container to GCR
gcloud docker -- push ${nginxContainerName}:$1

#create nginx configMap
kubectl create configmap nginx-conf \
--from-file=build/nginx/conf.d/default.conf

#create nginx secrets
kubectl create secret generic nginx-secret \
--from-file build/nginx/certs

#run in kubernetes
kubectl apply -f kubernetes/pod.yml
