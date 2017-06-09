# kubernetes-demo
Kubernetes wow demo

## Todo

- [x] setup basic project
- [x] create GCP project
- [x] create node container and push to docker hub
- [x] create pod spec
- [x] create kubernetes cluster yaml
- [x] push application pod
- [x] hit application
- [x] scale application up to handle load
- [x] tear down kubernetes cluster


## Demo

### Watch pods
`kubectl get pods -w`

### Kick off
`kubectl apply -f kubernetes/pod.yml`

### Updating to new version
`kubectl rolling-update tech-conf-2017 --image eu.gcr.io/tech-conf-2017/super-duper-app:2 --image-pull-policy Always`

### Rolling Back 
Jujhar broke the build
`kubectl rolling-update tech-conf-2017 --rollback`
`kubectl rolling-update tech-conf-2017 --image eu.gcr.io/tech-conf-2017/super-duper-app:1 --image-pull-policy Always`


### Scaling up
`kubectl apply -f kubernetes/pod.yml`

### Scaling Down
`kubectl apply -f kubernetes/pod.yml`
