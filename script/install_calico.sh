#curl https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/calico.yaml -O /home/vagrant/calico.yaml
#kubectl apply -f /home/vagrant/calico.yaml

sudo su -c "curl https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/calico.yaml -O /home/vagrant/calico.yaml" -s /bin/sh vagrant
sudo su -c "kubectl apply -f /home/vagrant/calico.yaml" -s /bin/sh vagrant