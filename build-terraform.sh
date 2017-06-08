#!/bin/bash

projectName="tech-conf-2017"
gcloud auth application-default login

gcloud config set project ${projectName}

echo "Check to see if I can connect to project"
gcloud compute instances list
if [ $? -ne 0 ]; then
	>&2 echo "error with gcloud auth"
	exit 1
fi

cd terraform && terraform apply

gcloud container clusters get-credentials ${projectName} --zone=europe-west1-c
kubectl proxy
