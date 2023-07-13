vagrant ssh control -c "sudo cat /vagrant/join.sh" > share/join.sh
vagrant scp ./share/join.sh worker1:/home/vagrant/join.sh
vagrant ssh worker1 -c "sudo chmod 755 /home/vagrant/join.sh"
