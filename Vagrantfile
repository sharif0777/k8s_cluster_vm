
CIDR = "192.168.2.0/24"
MasterIP = "192.168.2.153"
NodeIP = ["192.168.2.154", "192.168.2.155"]
NodeCount = 0
K8s_Version = "1.24"

#Vagrant.configure(2) do |config|
Vagrant.configure("2") do |config|
  # Kubernetes Master Server
  config.vm.define "control1" do |control|
    control.vm.box = "ubuntu/focal64"
    #control.vm.box_url = "file://C:/Users/sharif/Desktop/EKS-/k8s_cka_vagrant/k8s_cluster_vm/image/focal-server-amd64-vagrant.box"
    control.vm.hostname = "control1"
    #control.vm.network "private_network", ip: "192.168.56.110"
    control.vm.network "public_network", ip: "#{MasterIP}"
    #control.vm.synced_folder "share/", "/vagrant", owner: "vagrant", group: "vagrant"
    control.vm.provider "virtualbox" do |v|
      v.name = "control1"
      v.memory = 4096
      v.cpus = 2
      v.customize ['modifyvm', :id, '--graphicscontroller', 'vmsvga']
      v.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
      v.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
      v.customize ["modifyvm", :id, "--vtxvpid", "on"]
      v.customize ["modifyvm", :id, "--vtxux", "on"]
    end
    control.vm.provision "shell", path: "script/install.sh"
    control.vm.provision "shell", inline: "swapoff -a"
    control.vm.provision 'shell', reboot: true
    control.vm.provision "shell", inline: "kubeadm init --apiserver-advertise-address #{MasterIP} --pod-network-cidr=#{CIDR} --kubernetes-version #{K8s_Version}"
    control.vm.provision "shell", inline: <<-SHELL
      rm -rf /vagrant/join.sh 
      sudo kubeadm token create --print-join-command > /vagrant/join.sh
      chmod +x /vagrant/join.sh 
      SHELL
    control.vm.provision "shell", inline: "mkdir /home/vagrant/.kube && cp /etc/kubernetes/admin.conf /home/vagrant/.kube/config && chown -R vagrant:vagrant /home/vagrant/.kube"
    control.vm.provision "shell", path: "script/install_calico.sh"
    control.vm.provision "shell", path: "script/install_calico.sh"
  end

  
  # Kubernetes Worker Nodes
  #(0..NodeCount).each do |i|
  NodeIP.each do |i|
    NodeCount += 1
    config.vm.define "worker#{NodeCount}" do |workernode|
      workernode.vm.box = "ubuntu/focal64"
      #workernode.vm.box_url = "file://C:/Users/sharif/Desktop/EKS-/k8s_cka_vagrant/k8s_cluster_vm/image/focal-server-amd64-vagrant.box"
      workernode.vm.hostname = "worker#{NodeCount}"
      #workernode.vm.network "private_network", ip: "#{i}"
      workernode.vm.network "public_network", ip: "#{i}"
      #workernode.vm.synced_folder "share/", "/vagrant", owner: "vagrant", group: "vagrant"
      workernode.vm.provider "virtualbox" do |v|
        v.name = "worker#{NodeCount}"
        v.memory = 2048
        v.cpus = 1
        v.customize ['modifyvm', :id, '--graphicscontroller', 'vmsvga']
        v.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "100"]
        v.customize ["modifyvm", :id, "--vtxvpid", "on"]
        v.customize ["modifyvm", :id, "--vtxux", "on"]
      end
      workernode.vm.provision "shell", path: "script/install.sh"
      workernode.vm.provision 'shell', reboot: true
      workernode.vm.provision "shell", path: "script/join.sh"
    end
  end

end
