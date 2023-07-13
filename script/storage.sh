apt update && apt -y upgrade
apt install -y nfs-server
mkdir /data
cat << EOF >> /etc/exports
/data 192.168.2.153(rw,no_subtree_check,no_root_squash)
EOF
sudo mkdir -p /data
sudo chown nobody:nogroup /data
sudo chmod g+rwxs /data

systemctl enable --now nfs-server
sudo exportfs -ar
sudo exportfs -av 

sudo su -c "curl https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/master/deploy/install-driver.sh -O /home/vagrant/install-driver.sh" -s /bin/sh vagrant
chmod +x install-driver.sh
export KUBERNETES_MASTER=http://control:8080
sudo su -c "kubectl apply -f /home/vagrant/calico.yaml" -s /bin/sh vagrant
#worker node
apt install -y nfs-common
