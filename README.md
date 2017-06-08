# kubernetes-demo
Kubernetes wow demo

## Todo

- [x] setup basic project
- [] create GCP project
- [] create node container and push to docker hub
- [] create pod spec
- [] create vegita container and pod spec
- [] create kubernetes cluster yaml
- [] push application pod
- [] push vegita pod
- [] hit application
- [] scale application up to handle load
- [] tear down kubernetes cluster


## Demo


### Scaling up
`kubectl apply -f kubernetes/pod.yml`

### Scaling Down
`kubectl apply -f kubernetes/pod.yml`

### Updating to new version
`kubectl rolling-update tech-conf-2017`

### Rolling Back

`kubectl rolling-update tech-conf-2017 --rollback`