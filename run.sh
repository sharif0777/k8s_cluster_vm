#!/bin/bash
rm -rf .vagrant
vagrant up control
vagrant ssh control -c "sudo cat /vagrant/join.sh" > script/join.sh
vagrant up worker1