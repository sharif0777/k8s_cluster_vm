# CKA Lab Setup

Create a production grade cluster:
- 1 control
- 2 worker

Added :
- 1 Calico
- 2 Metrics Server

## Quickstart

Install the following:
- [vagrant](https://developer.hashicorp.com/vagrant/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads)
- [GitBash](https://git-scm.com/downloads)


```shell
$ git clone https://github.com/sharif0777/k8s_cluster_vm.git
$ cd k8s_cluster_vm

Change Master and Node IP Address in Vagrantfile, After That.....

$./run.sh
```

## To-do

 - NFS Storage
 - load balancer