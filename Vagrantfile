# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.cpus = 2
    vb.memory = "1024"
  end

  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.network "forwarded_port", guest: 8080, host: 8888
    #jenkins.vm.network "public_network", bridge: "eno2", ip: "192.168.10.1"
    jenkins.vm.network "public_network"

    jenkins.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.cpus = 2
      vb.memory = "1024"
      vb.name = "debian_bullseye_jenkins"
    end

    jenkins.vm.provision "shell" do |shell|
      shell.path = "jenkins.sh"
    end
  end 
end
