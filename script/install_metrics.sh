sudo su -c "curl https://raw.githubusercontent.com/sharif0777/k8s_cluster_vm/main/script/components.yaml -O /home/vagrant/components.yaml" -s /bin/sh vagrant
sudo su -c "kubectl apply -f /home/vagrant/components.yaml" -s /bin/sh vagrant